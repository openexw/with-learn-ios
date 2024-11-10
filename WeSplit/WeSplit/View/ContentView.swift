//
//  ContentView.swift
//  WeSplit
//
//  Created by 7yue on 2024/11/7.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured

    enum Tab {
        case featured
        case list
        case fishing
    }
    var body: some View {
        TabView(selection: $selection){
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
            
            FishGame()
                .tabItem {
                    Label("Fishing", systemImage: "fish")
                }.tag(Tab.fishing)
        }
//        VStack {
//            MapView()
//                .frame(height: 300)
//        CircleImage()
//                .offset(y: -130)
//                .padding(.bottom, -130)
//            
//        VStack(alignment:.leading) {
//            Text("Turtle Rock")
//                .font(.title)
//            HStack {
//                Text("Joshua Tree National Park")
//                    .font(.subheadline)
//                Spacer()
//                Text("California")
//                    .font(.subheadline)
//            }
//            .font(.subheadline)
//            .foregroundStyle(.secondary)
//            
//            Divider()
//            Text("About Turtle Rock")
//                               .font(.title2)
//                           Text("Descriptive text goes here.")
//        }
//        .padding(10)
//        Spacer()
//    }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
