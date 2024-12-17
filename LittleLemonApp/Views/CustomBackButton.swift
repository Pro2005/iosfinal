//
//  CustomBackButton.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-12-12.
//

import SwiftUI

struct CustomBackButton: View {
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "chevron.backward").renderingMode(.template).foregroundColor(.blue)
        }
    }
}
