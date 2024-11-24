//
//  TabBar.swift
//  design-code
//
//  Created by 7yue on 2024/11/24.
//

import SwiftUI

struct TabBar: View {
    @State var selectedTab: Tab = .home
    @State var color: Color = .teal
    @State var tabItemWidth: CGFloat = 0
    
    var body: some View {
        ZStack(alignment: .bottom){
            Group{
                switch selectedTab {
                case .home:
                    ContentView()
                case .expole:
                    PracticeView()
                case .notifucation:
                    CanvaAnimView()
                case .profile:
                    ProfileView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            HStack{
                buttons
            }
            .padding(.horizontal, 8)
            .padding(.top, 14)
            .frame(height: 88, alignment: .top)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
            .background(
                background
            )
            .overlay(
                overlay
            )
            .strokeStyle(cornerRadius: 34)
            .frame(maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
    
    var background: some View {
        HStack {
            if selectedTab == .profile { Spacer() }
            if selectedTab == .expole { Spacer() }
            if selectedTab == .notifucation {
                Spacer()
                Spacer()
            }
            Circle().fill(color).frame(width: tabItemWidth)
            if selectedTab == .home { Spacer() }
            if selectedTab == .expole {
                Spacer()
                Spacer()
            }
            if selectedTab == .notifucation { Spacer() }
        }
        .padding(.horizontal, 8)
    }
    var overlay: some View {
        HStack {
            if selectedTab == .profile { Spacer() }
            if selectedTab == .expole { Spacer() }
            if selectedTab == .notifucation {
                Spacer()
                Spacer()
            }
            Rectangle()
                .fill(color)
                .frame(width: 28, height: 5)
                .cornerRadius(3)
                .frame(width: tabItemWidth)
                .frame(maxHeight: .infinity, alignment: .top)
            if selectedTab == .home { Spacer() }
            if selectedTab == .expole {
                Spacer()
                Spacer()
            }
            if selectedTab == .notifucation { Spacer() }
        }
        .padding(.horizontal, 8)
    }
    var buttons: some View {
        ForEach(TabItems) { item in
            Button{
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    selectedTab = item.tab
                    color = item.color
                }
            } label: {
                VStack(spacing: 0) {
                    Image(systemName: item.icon)
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        .frame(width: 44, height: 29)
                    Text(item.text)
                        .font(.caption2)
                        .lineLimit(1)
                }
                .frame(maxWidth: .infinity)
            }
            .foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
            .blendMode(selectedTab == item.tab ? .overlay : .normal)
            .overlay(
                GeometryReader { proxy in
                    //  Text("\(proxy.size.width)")
                    Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
                }
            )
            .onPreferenceChange(TabPreferenceKey.self) { value in
                tabItemWidth = value
            }
        }
    }
}

#Preview {
    TabBar()
}
