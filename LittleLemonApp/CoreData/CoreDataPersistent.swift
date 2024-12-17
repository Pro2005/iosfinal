//
//  CoreDataService.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-12-03.
//

import Foundation
import CoreData

class CoreDataPersistent: ObservableObject, CoreDataContextProvider {
    private let container: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        container.viewContext
    }
    
    init(containerName: String) {
        self.container = .init(name: containerName)
        self.container.loadPersistentStores { desc, error in
            if let error = error {
                fatalError("Load persistent stores error: \(error)")
            }
        }
        if !UserDefaults.standard.bool(forKey: "preload") {
            self.container.viewContext.preload()
            UserDefaults.standard.set(true, forKey: "preload")
        }
    }
}
