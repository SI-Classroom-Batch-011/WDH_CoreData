//
//  WDH_CoreDataApp.swift
//  WDH_CoreData
//
//  Created by Brian Moyou on 17.05.24.
//

import SwiftUI

@main
struct WDH_CoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
