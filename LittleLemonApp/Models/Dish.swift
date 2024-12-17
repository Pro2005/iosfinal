//
//  Dish.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-12-03.
//

import Foundation

struct Dish: Identifiable, Decodable {
    let title: String
    let text: String
    let price: Float
    let image: String
    let category: String
    var id: String {
        title + "\(price)"
    }
}

struct Dishes: Decodable {
    let dishes: [Dish]
}

extension Dish {
    static func mock() -> Dish {
        return .init(title: "mock", text: "mock", price: 0, image: "", category: "")
    }
}

