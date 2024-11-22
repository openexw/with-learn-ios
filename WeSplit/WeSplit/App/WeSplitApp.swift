//
//  WeSplitApp.swift
//  WeSplit
//
//  Created by 7yue on 2024/11/7.
//

import SwiftUI

@main
struct WeSplitApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(ModelData())
        }
    #if os(watchOS)
    WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
    #endif
//    #if os(macos)
////        SettingView
//    #endif
    }
}
