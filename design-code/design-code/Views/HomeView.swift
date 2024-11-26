//
//  HomeView.swift
//  design-code
//
//  Created by 7yue on 2024/11/24.
//

import SwiftUI

struct HomeView: View {
    @State var hasScrolled = false
    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView{
                scrollDetection
                
                featured
                
                Color.clear.frame(height: 1000)
            }
            .coordinateSpace(name:"home")
            .onPreferenceChange(PreferenceKeys.self, perform: { value in
                withAnimation(.easeInOut){
                    if value < 0 {
                        hasScrolled = true
                    }else{
                        hasScrolled = false
                    }
                }
            })
            .safeAreaInset(edge: .top, content: {
                Color.clear.frame(height: 70)
            })
            .overlay{
                NavigationBar(title: "Featured", hasScrolled: $hasScrolled)
            }
        }
    }
    
    var scrollDetection: some View {
        GeometryReader { proxy in
            //                Text("\(proxy.frame(in: .global).minY)")
            Color.clear.preference(key: PreferenceKeys.self, value: proxy.frame(in: .named("home")).minY)
        }
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
