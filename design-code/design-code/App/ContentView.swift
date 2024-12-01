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
    @EnvironmentObject var model:Model
    
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
                .offset(y: model.showDetial ? 200 : 0)
        }.safeAreaInset(edge: .bottom, content: {
            Color.clear.frame(height: 44)
        })
    }
}


#Preview {
    ContentView()
        .environmentObject(Model())
}
