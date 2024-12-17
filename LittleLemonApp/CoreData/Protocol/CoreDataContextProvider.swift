//
//  CoreDataContextProvider.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-12-10.
//

import Foundation
import CoreData

protocol CoreDataContextProvider {
    var viewContext: NSManagedObjectContext { get }
}

class MockCoreDataContextProvider: CoreDataContextProvider {
    private let container: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        container.viewContext
    }
    
    init() {
        self.container = .init(name: "Model")

        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        container.persistentStoreDescriptions = [description]
        self.container.loadPersistentStores { desc, error in
            if let error = error {
                fatalError("Load persistent stores error: \(error)")
            }
        }
    }
    
}

extension CoreDataContextProvider {
    func save() {
        guard viewContext.hasChanges else {
            return
        }
        do {
            try viewContext.save()
        } catch {
            print("Error \(error.localizedDescription)")
        }
    }
}
