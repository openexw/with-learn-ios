//
//  HomeView.swift
//  design-code
//
//  Created by 7yue on 2024/11/24.
//

import SwiftUI

struct ExpHomeView: View {
    var body: some View {
        TabView{
            ContentView().tabItem {
                Image(systemName: "house")
                Text("Home")
            }

            PracticeView().tabItem {
                Image(systemName: "folder")
                Text("Learn")
            }
            ProfileView().tabItem {
                Image(systemName: "person")
                Text("Profile")
            }
        }
    }
}

#Preview {
    HomeView()
}
