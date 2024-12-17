//
//  String+Email.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-12-10.
//

import Foundation

extension String {
    func isEmail() -> Bool {
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: self)
    }
}
