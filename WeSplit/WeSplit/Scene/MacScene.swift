//
//  MacScene.swift
//  WeSplit
//
//  Created by 薄荷 on 2024/11/20.
//

import SwiftUI

struct MacScene: Scene {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(ModelData())
        }
        
#if os(macOS)
        
#endif
    }
}

