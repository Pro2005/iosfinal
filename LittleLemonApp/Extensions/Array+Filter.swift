//
//  Array+Filter.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-12-12.
//

import Foundation

extension Array where Element == Dish {
    func filter(by categories: Set<String>) -> Self {
        guard !categories.isEmpty else {
            return self
        }
        return filter { dish in
            categories.contains(dish.category)
        }
    }
    
    func filter(by search: String) -> Self {
        guard !search.isEmpty else {
            return self
        }
        let searchText = search.lowercased()
        return filter { dish in
            if dish.text.lowercased().contains(searchText) {
                return true
            }
            if dish.title.lowercased().contains(searchText) {
                return true
            }
            return false
        }
    }
}
