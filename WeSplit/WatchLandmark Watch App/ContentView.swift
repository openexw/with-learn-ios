//
//  ContentView.swift
//  WatchLandmark Watch App
//
//  Created by 7yue on 2024/11/12.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
            LandmarkList()
                .task {
                    let center = UNUserNotificationCenter.current()
                    _ = try? await center.requestAuthorization(
                        options: [.alert, .sound, .badge]
                    )
                }
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
