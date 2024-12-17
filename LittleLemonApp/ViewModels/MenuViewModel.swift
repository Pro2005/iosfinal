//
//  MenuViewModel.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-12-03.
//

import Foundation
import Combine

class MenuViewModel: ObservableObject {
    private let service: CoreDataDishService
    var dishes: [Dish] {
        service.entities
    }
    
    init(coreDataContextProvider: CoreDataContextProvider) {
        service = .init(provider: coreDataContextProvider)
    }
}
