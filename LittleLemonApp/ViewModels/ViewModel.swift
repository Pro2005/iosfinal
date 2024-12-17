//
//  ViewModel.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-06-10.
//

import Foundation

import Foundation
import Combine


//extension String {
//    enum UserDefaultKey {
//        static let firstName = "first name key"
//        static let lastName = "last name key"
//        static let email = "email"
//        static let isLoggedIn = "is logged in"
//        static let phoneNumber = "phone number"
//        static let orderStatuses = "order status"
//        static let passwordChange = "password change"
//        static let specialOffers = "special offer"
//        static let newsLetter = "news leter"
//    }
//}

class ViewModel: ObservableObject {
    
//    @Published var firstName = UserDefaults.standard.string(forKey: .UserDefaultKey.firstName) ?? ""
//    @Published var lastName = UserDefaults.standard.string(forKey: .UserDefaultKey.lastName) ?? ""
//    @Published var email = UserDefaults.standard.string(forKey: .UserDefaultKey.email) ?? ""
//    @Published var phoneNumber = UserDefaults.standard.string(forKey: .UserDefaultKey.phoneNumber) ?? ""
//    
//    @Published var orderStatuses = UserDefaults.standard.bool(forKey: .UserDefaultKey.orderStatuses)
//    @Published var passwordChanges = UserDefaults.standard.bool(forKey: .UserDefaultKey.passwordChange)
//    @Published var specialOffers = UserDefaults.standard.bool(forKey: .UserDefaultKey.specialOffers)
//    @Published var newsletter = UserDefaults.standard.bool(forKey: .UserDefaultKey.newsLetter)
    
    
//    @Published var errorMessageShow = false
//    @Published var errorMessage = ""
    
//    @Published var searchText = ""
    
//    func validateUserInput(firstName: String, lastName: String, email: String, phoneNumber: String) -> Bool {
//        guard !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty else {
//            errorMessage = "All fields are required"
//            errorMessageShow = true
//            return false
//        }
//        
//        guard email.contains("@") else {
//            errorMessage = "Invalid email address"
//            errorMessageShow = true
//            return false
//        }
//        
//        let email = email.split(separator: "@")
//        
//        guard email.count == 2 else {
//            errorMessage = "Invalid email address"
//            errorMessageShow = true
//            return false
//        }
//        
//        guard email[1].contains(".") else {
//            errorMessage = "Invalid email address"
//            errorMessageShow = true
//            return false
//        }
//        guard phoneNumber.first == "+" && phoneNumber.dropFirst().allSatisfy({$0.isNumber}) || phoneNumber.isEmpty else {
//            errorMessage = "Invalid phone number format."
//            errorMessageShow = true
//            return false
//        }
//        errorMessageShow = false
//        errorMessage = ""
//        return true
//    }
}
