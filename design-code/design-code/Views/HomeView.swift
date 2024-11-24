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
        ScrollView{
            GeometryReader { proxy in
//                Text("\(proxy.frame(in: .global).minY)")
                Color.clear.preference(key: PreferenceKeys.self, value: proxy.frame(in: .named("home")).minY)
            }
            .frame(height: 0)
            
            FeatureItem()
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
            NavigationBar(title: "Featured")
                .opacity(hasScrolled ? 1 : 0)
        }
    }
}

#Preview {
    HomeView()
}
