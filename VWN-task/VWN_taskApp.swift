//
//  VWN_taskApp.swift
//  VWN-task
//
//  Created by wecancity on 16/04/2022.
//

import SwiftUI

@main
struct VWN_taskApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
