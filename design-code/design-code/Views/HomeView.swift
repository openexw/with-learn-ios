//
//  HomeView.swift
//  design-code
//
//  Created by 7yue on 2024/11/24.
//

import SwiftUI

struct HomeView: View {
    @State var hasScrolled = false
    @Namespace var namespace
    @State var show = false
    @State var showStatusBar = false
    @State var selectedId:UUID = UUID()
    @State var showDetail = false
    @State var featureSelectedIdx = 0
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView{
                scrollDetection
                
                featured
                
                Text("courses".uppercased())
                    .font(.footnote.weight(.semibold))
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 300),spacing: 20)], spacing: 20){
                    if !show {
                        cards
                    }  else {
                        // 占位符，当关闭页面时，没有占位符，会导致首页重新刷新回到顶部，回到顶部
                        // 上面判断的是只有 !show 才会从 model 中加载 courseItem，当 show == true 时就没有位置去渲染该模块
                        ForEach(courses) { course in
                            Rectangle()
                                .fill(.white)
                                .frame(height: 300)
                                .cornerRadius(30)
                                .shadow(color: Color("Shadow"), radius: 20, x: 0, y: 10)
                                .opacity(0.3)
                                .padding(.horizontal, 30)
                        }
                    }
                }
                .padding(20)
            }
            .coordinateSpace(name:"home")
            
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay{
                NavigationBar(title: "Featured", hasScrolled: $hasScrolled)
            }
            .statusBar(hidden: !showStatusBar)
            .onChange(of: show) { _, newVal in
                withAnimation(.closeCard){
                    if newVal {
                        showStatusBar = false
                    } else{
                        showStatusBar = true
                    }
                }
            }
            if show {
                detail
            }
        }
    }
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            //                Text("\(proxy.frame(in: .global).minY)")
            Color.clear.preference(key: PreferenceKeys.self, value: proxy.frame(in: .named("home")).minY)
        }
        // fix: 导航栏动画失效
        // 从 ScrollView 移动到 GeometryReader
        .onPreferenceChange(PreferenceKeys.self, perform: { value in
            withAnimation(.easeInOut){
                if value < 0 {
                    hasScrolled = true
                }else{
                    hasScrolled = false
                }
            }
        })
        .frame(height: 0)
    }
    var featured:some View {
        TabView{
            ForEach(Array(featuredCourses.enumerated()), id:\.offset) { index,course in
                GeometryReader { proxy in // 使用 GeometryReader 后会导致检测的区域只包含 FeatureItem 这个容器，需要通过设置 padding 来增加容器
                    let minX = proxy.frame(in: .named("home")).minX
                    FeatureItem(course: course)
                        .frame(maxWidth: 500)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 40)
                        .rotation3DEffect(
                            .degrees(minX / -10),
                            axis: (x: 0,y: 1, z:0)
                        )
                        .blur(radius: abs(minX/40))
                        .overlay(
                            Image(course.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 230)
                                .offset(x: 32, y: -100)
                                .offset(x: minX / 2)
                        )
                        .onTapGesture {
                            showDetail = true
                            featureSelectedIdx = index
                        }
                        .shadow(color:Color("Shadow").opacity(0.3),radius: 10, x: 0, y:10)
                    //                    Text("\(proxy.frame(in: .global).minX/10)")
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(Image("Blob 1").offset(x:250, y:-100))
        .sheet(isPresented: $showDetail, content: {
            CourseView(namespace: namespace, course: featuredCourses[featureSelectedIdx],show: $showDetail)
        })
    }
    
    var cards: some View {
        ForEach(courses) { course in
            CourseItem(namespace: namespace, show: $show, course: course)
                .onTapGesture {
                    withAnimation(.openCard){
                        show.toggle()
                        model.showDetial.toggle()
                        
                        showStatusBar = false
                        selectedId = course.id
                    }
                }
        }
    }
    
    var detail : some View {
        ForEach(courses) { course in
            if course.id == selectedId {
                CourseView(namespace: namespace, course: course, show: $show)
                    .zIndex(1) // 默认为 0
                    .transition(.asymmetric(
                        insertion: .opacity.animation(.easeInOut(duration:0.1)), // 进入的动画
                        removal: .opacity.animation(.easeInOut(duration:0.3).delay(0.2)))//离开时的动画
                    )
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(Model())
}
