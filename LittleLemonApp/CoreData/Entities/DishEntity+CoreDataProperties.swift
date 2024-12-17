//
//  Dish+CoreDataProperties.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-12-03.
//
//

import Foundation
import CoreData

extension DishEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DishEntity> {
        return NSFetchRequest<DishEntity>(entityName: "Dish")
    }

    @NSManaged public var category: CategoryEntity
    @NSManaged public var image: String
    @NSManaged public var price: Float
    @NSManaged public var text: String
    @NSManaged public var title: String
}

extension DishEntity : Identifiable {
    
}

extension DishEntity: EntityRepresentative {
    func transform() -> Dish {
        .init(title: title, text: text, price: price, image: image, category: category.name)
    }
    
    func update(from object: Dish) {
        image = object.image
        price = object.price
        text = object.text
        title = object.title
    }
}
