//
//  TabItems.swift
//  design-code
//
//  Created by 7yue on 2024/11/24.
//

import Foundation
import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var icon: String
    var tab:Tab
    var color: Color
}

var TabItems = [
    TabItem( text: "Home", icon: "house", tab: .home, color: .teal),
    TabItem( text: "Expole", icon: "magnifyingglass", tab: .expole, color: .blue),
    TabItem( text: "Notification", icon: "bell", tab: .notifucation, color: .red),
    TabItem( text: "Profile", icon: "person",tab: .profile, color: .pink)
]

enum Tab: String {
    case home
    case expole
    case notifucation
    case profile
}

struct TabPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

