//
//  PersistentStore.swift
//  WDH_CoreData
//
//  Created by Brian Moyou on 17.05.24.
//

import CoreData

class PersistentStore {
    private let container: NSPersistentContainer
    var context: NSManagedObjectContext { container.viewContext }
    
    init() {
        container = NSPersistentContainer(name: "WDH_CoreData")
        container.loadPersistentStores { _, error in
            if let error {
                fatalError("Error: \(error)")
            }
        }
    }
    
    func save() throws {
        try context.save()
    }
}
