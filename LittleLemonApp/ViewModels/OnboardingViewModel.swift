//
//  OnboardingViewModel.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-12-07.
//

import Foundation
import Combine

class OnboardingViewModel: ObservableObject {
    @Published var isFinished: Bool = false
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var phoneNumber: String = ""
    @Published var errorMessage: String? = nil
    var isFirstNameAvailable: Bool {
        currentPage == .first
    }
    var isLastNameAvailable: Bool {
        currentPage == .first
    }
    var isEmailAvailable: Bool {
        currentPage == .second
    }
    var isPhoneNumberAvailable: Bool {
        currentPage == .third
    }
    var isReturnAvailable: Bool {
        currentPage != .first
    }
    private let service: CoreDataProfileService
    var profile: Profile? {
        service.entities.first
    }
    var isLoggedIn: Bool {
        profile != nil
    }
    enum Page {
        case first, second, third
        var isFinal: Bool {
            self == .third
        }
        
        mutating func next() {
            switch self {
            case .first:
                self = .second
            case .second:
                self = .third
            case .third:
                break
            }
        }
        
        mutating func back() {
            switch self {
            case .first:
                break
            case .second:
                self = .first
            case .third:
                self = .second
            }
        }
    }
    @Published var currentPage: Page = .first
    var isLastPage: Bool {
        currentPage == .third
    }
    
    init(coreDataContextProvider: CoreDataContextProvider) {
        service = .init(provider: coreDataContextProvider)
    }
    
    func start() {
        if profile != nil {
            isFinished = true
        }
    }
    
    func save() {
        validation()
    }
    
    func next() {
        guard errorMessage == nil else {
            return
        }
        guard currentPage.isFinal == false else {
            service.save(profile: .init(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber, orderStatuses: true, criticalUpdates: true, specialOffers: true, newsLetter: true))
            isFinished = true
            return
        }
        currentPage.next()
    }
    
    func back() {
        errorMessage = nil
        currentPage.back()
    }
    
    private func validation() {
        if isFirstNameAvailable {
            guard firstName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false else {
                errorMessage = "First name is required"
                return
            }
        }
        if isLastNameAvailable {
            guard  lastName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty == false else {
                errorMessage = "Last name is required"
                return
            }
        }
        if isEmailAvailable {
            guard email.isEmail() == true else {
                errorMessage = "Wrong email"
                return
            }
        }
        errorMessage = nil
    }

}
