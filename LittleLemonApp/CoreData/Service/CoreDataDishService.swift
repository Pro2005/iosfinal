//
//  CoreDataDishService.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-12-10.
//

import Foundation
import CoreData

class CoreDataDishService: CoreDataService {
    @Published var entities: [Dish] = []
    typealias T = DishEntity
    let entityName: String
    let contextProvider: CoreDataContextProvider
    
    init(provider: CoreDataContextProvider) {
        self.contextProvider = provider
        self.entityName = T.entity().name!
        getEntities()
    }
}
