//
//  ProfileEntity+CoreDataProperties.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-12-07.
//
//

import Foundation
import CoreData


extension ProfileEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProfileEntity> {
        return NSFetchRequest<ProfileEntity>(entityName: "ProfileEntity")
    }

    @NSManaged public var firstName: String
    @NSManaged public var lastName: String
    @NSManaged public var email: String
    @NSManaged public var phoneNumber: String
    @NSManaged public var orderStatuses: Bool
    @NSManaged public var criticalUpdates: Bool
    @NSManaged public var specialOffers: Bool
    @NSManaged public var newsLetter: Bool
    @NSManaged public var isLoggedIn: Bool

}

extension ProfileEntity : Identifiable {

}

extension ProfileEntity: EntityRepresentative {
    
    func transform() -> Profile {
        .init(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber, orderStatuses: orderStatuses, criticalUpdates: criticalUpdates, specialOffers: specialOffers, newsLetter: newsLetter)
    }
    
    func update(from object: Profile) {
        self.firstName = object.firstName
        self.lastName = object.lastName
        self.email = object.email
        self.phoneNumber = object.phoneNumber
        self.orderStatuses = object.orderStatuses
        self.criticalUpdates = object.criticalUpdates
        self.specialOffers = object.specialOffers
        self.newsLetter = object.newsLetter
    }
  
}
