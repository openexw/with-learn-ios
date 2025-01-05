//
//  ContentView.swift
//  LearnDesignCode
//
//  Created by 7yue on 2024/12/9.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            TabView {
                NavigationView {
                    Text("行程计划")
                        .navigationTitle("行程计划")
                }
                .tabItem {
                    Image(systemName: "map")
                    Text("行程计划")
                }
                
                NavigationView {
                    Text("我的旅程")
                        .navigationTitle("我的旅程") 
                }
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("我的旅程")
                }
            }
            VStack {
                Spacer()
                Button(action: {
                    // 添加行程的动作
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.blue)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                }
                .offset(y: -30)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
