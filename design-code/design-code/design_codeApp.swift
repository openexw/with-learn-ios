//
//  design_codeApp.swift
//  design-code
//
//  Created by 7yue on 2024/11/24.
//

import SwiftUI

@main
struct design_codeApp: App {
    @StateObject var model = Model()
       
    var body: some Scene {
        WindowGroup {
//          StateBar()
            ContentView()
                .environmentObject(model)
        }
    }
}
