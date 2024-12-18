//
//  CourseView.swift
//  design-code
//
//  Created by 7yue on 2024/12/1.
//

import SwiftUI

struct CourseView: View {
    var namespace: Namespace.ID
    var course: Course = courses[0]
    @Binding var show: Bool
    @EnvironmentObject var model: Model
    @State var appear = [false,false,false]
    @State var viewState: CGSize = .zero
    @State var isDraggable = true
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
                content
                    .offset(y: 120)
                    .padding(.bottom, 200) // 设置下边距（有 tabbar）
                    .opacity( appear[2] ? 1 : 0)
            }
            .coordinateSpace(name: "scroll")
            .background(Color("Background"))
            .onAppear { model.showDetial = true }
            .onDisappear { model.showDetial = false }
            // 设置右滑后的背景以及主体
            .mask(RoundedRectangle(cornerRadius: viewState.width / 3, style: .continuous)) // 主体设置为圆角
            .shadow(color: .black.opacity(0.3), radius: 30, x: 0, y: 10) // 设置主体阴影
            .scaleEffect(viewState.width / -500 + 1) // 设置主体缩放
            .background(.black.opacity(viewState.width / 500)) // 设置右滑后的背景颜色
            .background(.ultraThinMaterial)
            .gesture(isDraggable ? drag : nil) // 添加手势处理
            .gesture(isDraggable ? drag : nil)
            .ignoresSafeArea()
            
            button
        }
        .onAppear{
            fadeIn()
        }
        .onChange(of: show) { _, newValue in
            fadeOut()
        }
    }
    var content: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text("SwiftUI is hands-down the best way for designers to take a first step into code. ")
                .font(.title3).fontWeight(.medium)
            Text("This course")
                .font(.title).bold()
            Text("This course is unlike any other. We care about design and want to make sure that you get better at it in the process. It was written for designers and developers who are passionate about collaborating and building real apps for iOS and macOS. While it's not one codebase for all apps, you learn once and can apply the techniques and controls to all platforms with incredible quality, consistency and performance. It's beginner-friendly, but it's also packed with design tricks and efficient workflows for building great user interfaces and interactions.")
            Text("This year, SwiftUI got major upgrades from the WWDC 2020. The big news is that thanks to Apple Silicon, Macs will be able to run iOS and iPad apps soon. SwiftUI is the only framework that allows you to build apps for all of Apple's five platforms: iOS, iPadOS, macOS, tvOS and watchOS with the same codebase. New features like the Sidebar, Lazy Grid, Matched Geometry Effect and Xcode 12's visual editing tools will make it easier than ever to build for multiple platforms.")
            Text("Multiplatform app")
                .font(.title).bold()
            Text("For the first time, you can build entire apps using SwiftUI only. In Xcode 12, you can now create multi-platform apps with minimal code changes. SwiftUI will automatically translate the navigation, fonts, forms and controls to its respective platform. For example, a sidebar will look differently on the Mac versus the iPad, while using exactly the same code. Dynamic type will adjust for the appropriate platform language, readability and information density. ")
        }
        .padding(20)
    }
    var button : some View {
        Button{
            withAnimation(.closeCard ){
                show.toggle()
                model.showDetial.toggle()
            }
        } label: {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundStyle(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in:Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        //            .padding(.top, 20)
        .ignoresSafeArea()
    }
    var cover: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .global).minY
            
            VStack{
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: scrollY > 0 ? 500 + scrollY : 500)
            .foregroundStyle(.black)
            .background(
                Image(course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .frame(minWidth: 500)
                    .matchedGeometryEffect(id: "image\(course.id)", in: namespace)
                    .offset(y: scrollY > 0 ? scrollY * 0.8 : 0)
            )
            .background(
                Image(course.background)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "background\(course.id)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
                    .blur(radius: scrollY / 10)
            )
            .mask(
                RoundedRectangle(cornerRadius: appear[0] ? 0: 30, style: .continuous)
                    .matchedGeometryEffect(id: "mask\(course.id)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
            )
            
            .overlay(
                overlayContent
                    .offset(y: scrollY > 0 ? scrollY * -0.6 : 0)
            )
        }
        .frame(height: 500)
    }
    
    var overlayContent: some View {
        VStack(alignment: .leading,spacing: 12){
            Text(course.text)
                .font(.footnote)
                .matchedGeometryEffect(id: "text\(course.id)", in: namespace)
            Text(course.subtitle.uppercased())
                .font(.footnote.weight(.semibold))
                .matchedGeometryEffect(id: "subtitle\(course.id)", in: namespace)
            Text(course.title)
                .font(.largeTitle.weight(.bold))
                .matchedGeometryEffect(id: "title\(course.id)", in: namespace)
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider()
                .opacity(appear[0] ? 1 : 0)
            HStack {
                Image("Avatar Default")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .strokeStyle(cornerRadius: 18)
                Text("Taught by Meng To")
                    .font(.footnote)
            }
            .opacity(appear[1] ? 1 : 0)
        }
        .padding(20)
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .matchedGeometryEffect(id: "blur\(course.id)", in: namespace)
        )
        .offset(y: 250)
        .padding(20)
    }
    
    var drag : some Gesture {
        DragGesture(minimumDistance: 30, coordinateSpace: .local)
            .onChanged{ value in
                // 只有当 width > 0 时赋值
                guard value.translation.width > 0 else {return }
                
                // 检测只有当位移小于 100 时才会赋值
                if value.startLocation.x < 100 {
                    withAnimation(.closeCard){
                        viewState = value.translation
                    }
                }
                if value.startLocation.x > 120 { // 超过 120 直接关闭页面
                    close()
                }
            }
            .onEnded { value in // 手指松开时的状态
                if viewState.width > 80 {
                    close()
                } else {
                    withAnimation(.closeCard) {
                        viewState = .zero
                    }
                }
                
            }
    }
    func fadeIn(){
        withAnimation(.easeOut.delay(0.3)){
            appear[0] = true
        }
        withAnimation(.easeOut.delay(0.4)){
            appear[1] = true
        }
        withAnimation(.easeOut.delay(0.5)){
            appear[2] = true
        }
    }
    
    func fadeOut(){
        appear[0] = false
        appear[1] = false
        appear[2] = false
    }
    
    func close() {
        withAnimation(.closeCard.delay(0.3) ){ // 当 width 超过 80 时关闭该 view，与 x 按钮功能一致
            show.toggle()
            model.showDetial.toggle()
        }
        withAnimation(.closeCard) {
            viewState = .zero
        }
        isDraggable = false
    }
}

#Preview {
    @Namespace var namespace
    return CourseView(namespace: namespace,course: courses[0], show: .constant(true)).environmentObject(Model())
}
