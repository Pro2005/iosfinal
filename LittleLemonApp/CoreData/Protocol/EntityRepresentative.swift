//
//  EntityRepresentative.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-12-03.
//

import Foundation
import CoreData

protocol EntityRepresentative where Self: NSManagedObject {
    associatedtype T
    func transform() -> T
    func update(from object: T)
}
