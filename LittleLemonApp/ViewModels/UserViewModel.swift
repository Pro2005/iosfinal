//
//  UserViewModel.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-12-13.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var phoneNumber = ""
    @Published var isLoggedOut = false
    @Published var newsLetter: Bool = true
    @Published var orderStatus: Bool = true
    @Published var specialOrder: Bool = true
    @Published var criticalUpdates: Bool = true
    private let service: CoreDataProfileService
    
    init(coreDataContextProvider: CoreDataContextProvider) {
        service = .init(provider: coreDataContextProvider)
        refresh()
    }
    
    func logout() {
        do {
            try service.removeAll()
        } catch {
            return
        }
        isLoggedOut = true
    }
    
    func save() {
        let profile = Profile(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber, orderStatuses: orderStatus, criticalUpdates: criticalUpdates, specialOffers: specialOrder, newsLetter: newsLetter)
        service.save(profile: profile)
    }
    
    private func refresh() {
        guard let profile = service.entities.first else {
            return
        }
        firstName = profile.firstName
        lastName = profile.lastName
        email = profile.email
        phoneNumber = profile.phoneNumber
        orderStatus = profile.orderStatuses
        criticalUpdates = profile.criticalUpdates
        specialOrder = profile.specialOffers
        newsLetter = profile.newsLetter
    }
}
