//
//  CategoryEntity+CoreDataProperties.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-12-12.
//
//

import Foundation
import CoreData


extension CategoryEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CategoryEntity> {
        return NSFetchRequest<CategoryEntity>(entityName: "CategoryEntity")
    }

    @NSManaged public var name: String
    @NSManaged public var dishes: NSSet

}

extension CategoryEntity : Identifiable {

}

extension CategoryEntity {

    @objc(addDishesObject:)
    @NSManaged public func addToDishes(_ value: DishEntity)

    @objc(removeDishesObject:)
    @NSManaged public func removeFromDishes(_ value: DishEntity)

    @objc(addDishes:)
    @NSManaged public func addToDishes(_ values: NSSet)

    @objc(removeDishes:)
    @NSManaged public func removeFromDishes(_ values: NSSet)

}
