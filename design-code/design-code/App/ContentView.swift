//
//  ContentView.swift
//  design-code-x
//
//  Created by 薄荷 on 2024/11/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    
    var body: some View {
        ZStack(alignment: .bottom){
            switch selectedTab {
            case .home:
                HomeView()
            case .expole:
                PracticeView()
            case .notifucation:
                CanvaAnimView()
            case .profile:
                ProfileView()
            }
            TabBar()
        }.safeAreaInset(edge: .bottom, content: {
            Color.clear.frame(height: 44)
        })
    }
}


#Preview {
    ContentView()
}
