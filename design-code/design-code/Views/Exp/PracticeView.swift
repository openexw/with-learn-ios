//
//  PracticeView.swift
//  design-code
//
//  Created by 7yue on 2024/11/24.
//

import SwiftUI

struct PracticeView: View {
    var body: some View {
        NavigationSplitView{
            List {
                Section {
                    Text("基础模块")
                    NavigationLink(destination: ProfileView()) {
                        Label("Proifle", systemImage: "person.fill")
                    }
                    NavigationLink(destination: CanvaView()) {
                        Label("Canvas", systemImage: "compass.drawing")
                    }
                    NavigationLink(destination: CanvaAnimView()) {
                        Label("Timeline", systemImage: "compass.drawing")
                    }
                    NavigationLink(destination: ExpHomeView()) {
                        Label("TabBar", systemImage: "house")
                    }
                }
                .listRowSeparator(.hidden)
                .listRowSeparatorTint(.blue)
            }
          
        } detail: {
           ProfileView()
        }
    }
}

#Preview {
    PracticeView()
}
