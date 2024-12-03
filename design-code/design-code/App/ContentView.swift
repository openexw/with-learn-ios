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
    @AppStorage("showModal") var showModal = false
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
            
            if showModal {
                ZStack {
                    Color.clear.background(.ultraThinMaterial).ignoresSafeArea()
                    
                    SignUpView()
                    Button {
                        withAnimation {
                            showModal = false
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .font(.body.weight(.bold))
                            .foregroundStyle(.secondary)
                            .padding(8)
                            .background(.ultraThinMaterial, in:Circle())
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity,  alignment: .topTrailing)
                    .padding(20)
                }
                .zIndex(1)
            }
        }.safeAreaInset(edge: .bottom, content: {
            Color.clear.frame(height: 44)
        })
    }
}


#Preview {
    ContentView()
        .environmentObject(Model())
}
