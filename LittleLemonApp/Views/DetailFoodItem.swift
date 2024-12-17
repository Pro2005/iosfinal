//
//  DetailFoodItem.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-12-03.
//

import SwiftUI

struct DetailFoodItem: View {
    let dish: Dish
    
    var body: some View {
        ScrollView {
            Image(dish.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            .clipShape(Rectangle())
            .frame(minHeight: 150)
            Text(dish.title)
                .font(.subTitleFont())
                .foregroundColor(.primaryColor1)
            Spacer(minLength: 20)
            Text(dish.text)
                .font(.regularText())
                .padding()
            Spacer(minLength: 10)
            Text("$" + "\(dish.price)")
                .font(.highlightText())
                .foregroundColor(.primaryColor1)
                .monospaced()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .ignoresSafeArea()
    }
}

#Preview {
    DetailFoodItem(dish: Dish.mock())
}
