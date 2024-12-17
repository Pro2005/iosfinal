//
//  CoreDataProfileService.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-12-10.
//

import Foundation
import CoreData

class CoreDataProfileService: CoreDataService {
    @Published var entities: [Profile] = []
    typealias T = ProfileEntity
    let entityName: String
    let contextProvider: CoreDataContextProvider
    
    init(provider: CoreDataContextProvider) {
        self.contextProvider = provider
        self.entityName = T.entity().name!
        getEntities()
    }
    
    func removeAll() throws {
        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
        let entities = try contextProvider.viewContext.fetch(fetchRequest)
        entities.forEach { entity in
            contextProvider.viewContext.delete(entity)
        }
        try contextProvider.viewContext.save()
    }
    
    func save(profile: Profile) {
        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
        let entities = try? contextProvider.viewContext.fetch(fetchRequest)
        var entity: T? = nil
        if let existEntity = entities?.first {
            entity = existEntity
        } else {
            entity = T(entity: T.entity(), insertInto: contextProvider.viewContext)
        }
        entity?.update(from: profile)
        contextProvider.save()
    }
}
