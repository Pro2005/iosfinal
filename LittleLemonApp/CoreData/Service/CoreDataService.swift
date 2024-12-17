//
//  CoreDataService.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-12-10.
//

import Foundation
import CoreData

protocol CoreDataService: AnyObject {
    var entityName: String { get }
    var contextProvider: CoreDataContextProvider { get }
    associatedtype T: EntityRepresentative
    var entities: [T.T] { get set }
}

extension CoreDataService {
    func getEntities() {
        let request = NSFetchRequest<T>(entityName: entityName)
        do {
            let result = try contextProvider.viewContext.fetch(request)
            entities = result.map{$0.transform()}
        } catch {
            print("Get entities error \(error)")
        }
    }
}
