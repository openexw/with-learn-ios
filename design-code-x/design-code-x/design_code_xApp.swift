//
//  design_code_xApp.swift
//  design-code-x
//
//  Created by 薄荷 on 2024/11/22.
//

import SwiftUI

@main
struct design_code_xApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            AccountView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
