//
//  AppScene.swift
//  WeSplit
//
//  Created by 薄荷 on 2024/11/20.
//

import SwiftUI

struct AppScene: Scene {
    var body: some Scene {
#if os(iOS)
        WindowGroup {
            ContentView()
                .environment(ModelData())
        }
#endif
        
    }
}
