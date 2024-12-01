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
                
                if !show {
                    CourseItem(namespace: namespace, show: $show)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)){
                                show.toggle()
                            }
                        }
                }
            }
            .coordinateSpace(name:"home")
            
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay{
                NavigationBar(title: "Featured", hasScrolled: $hasScrolled)
            }
            if show {
                CourseView(namespace: namespace, show: $show)
                
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
            ForEach(courses) { course in
                GeometryReader { proxy in // 使用 GeometryReader 后会导致检测的区域只包含 FeatureItem 这个容器，需要通过设置 padding 来增加容器
                    let minX = proxy.frame(in: .global).minX
                    FeatureItem(course: course)
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
                    
                        .shadow(color:Color("Shadow").opacity(0.3),radius: 10, x: 0, y:10)
                    //                    Text("\(proxy.frame(in: .global).minX/10)")
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 430)
        .background(Image("Blob 1").offset(x:250, y:-100))
    }
}

#Preview {
    HomeView()
}
