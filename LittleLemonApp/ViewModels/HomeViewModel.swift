//
//  HomeViewModel.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-12-11.
//

import Foundation
import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var selectedCategories: Set<String> = []
    @Published var categories: Array<String> = []
    @Published var search: String = ""
    private let service: CoreDataDishService
    var dishes: [Dish] {
        service.entities
            .filter(by: selectedCategories)
            .filter(by: search)
    }
    
    init(coreDataContextProvider: CoreDataContextProvider) {
        service = .init(provider: coreDataContextProvider)
        categories = Array(Set(service.entities.map{$0.category}))
    }
    
    func makeBinding(for category: String) -> Binding<Bool> {
        .init(get: {[unowned self] in self.selectedCategories.contains(category)}) {[unowned self] isSelected in
            if isSelected {
                self.selectedCategories.insert(category)
            } else {
                self.selectedCategories.remove(category)
            }
        }
    }
    
//    private func filter(dishes: [Dish], by categories: Set<String>) -> [Dish] {
//        guard !categories.isEmpty else {
//            return dishes
//        }
//        return dishes.filter { dish in
//            categories.contains(dish.category)
//        }
//    }
//    
//    private func search(dishes: [Dish], search: String) -> [Dish] {
//        guard !search.isEmpty else {
//            return dishes
//        }
//        return dishes.filter { dish in
//            if dish.text.lowercased().contains(search) {
//                return true
//            }
//            if dish.title.lowercased().contains(search) {
//                return true
//            }
//            return false
//        }
//    }
    
}
