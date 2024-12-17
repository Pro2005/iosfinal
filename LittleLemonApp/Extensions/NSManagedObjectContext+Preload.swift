//
//  NSManagedObjectContext+Preload.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-12-12.
//

import Foundation
import CoreData

extension NSManagedObjectContext {
    func preload() {
        guard let url = Bundle.main.url(forResource: "preload", withExtension: "json") else {
            fatalError()
        }
        let decoder = JSONDecoder()
        guard let data = try? Data(contentsOf: url) else {
            fatalError()
        }
        var decodedObject: Dishes!
        do {
            decodedObject = try decoder.decode(Dishes.self, from: data)
        } catch {
            fatalError(error.localizedDescription)
        }
        let categories: Set<String> = Set(decodedObject.dishes.map{$0.category})
        let categoryEntities = categories.map { category in
            let entity = CategoryEntity(entity: CategoryEntity.entity(), insertInto: self)
            entity.name = category
            return entity
        }
        decodedObject.dishes.forEach {
            let entity = DishEntity(entity: DishEntity.entity(), insertInto: self)
            entity.update(from: $0)
            let category = $0.category
            if let categoryEntity = categoryEntities.first(where: {$0.name == category}) {
                categoryEntity.addToDishes(entity)
            }
        }
        try? self.save()
    }
    
}
