//
//  ContentView.swift
//  BankEase
//
//  Created by 7yue on 2025/1/3.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
           HomeView()
                .tabItem {
                    HStack{
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            MessageView()
                .tabItem {
                    Label("Message", systemImage: "envelope")
                }
            SettingView()
                .tabItem {
                    Label("Setting", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    ContentView()
}
