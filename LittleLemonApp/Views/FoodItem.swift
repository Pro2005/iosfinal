//
//  FoodItem.swift
//  LittleLemonApp
//
//  Created by Jevgeni Vakker on 21.03.2023.
//

import SwiftUI

struct FoodItem: View {
    
    let dish:Dish
    
    var body: some View {
        HStack {
            VStack {
                Text(dish.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.sectionCategories())
                    .foregroundColor(.black)
                Spacer(minLength: 10)
                Text(dish.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.paragraphText())
                    .foregroundColor(.primaryColor1)
                    .lineLimit(2)
                Spacer(minLength: 5)
                Text("$" + "\(dish.price)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.highlightText())
                    .foregroundColor(.primaryColor1)
                    .monospaced()
            }
            Image(dish.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
            .frame(maxWidth: 90, maxHeight: 90)
            .clipShape(Rectangle())
        }
        .padding(.vertical)
        .frame(maxHeight: 150)
    }
}

struct FoodItem_Previews: PreviewProvider {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    static var previews: some View {
        FoodItem(dish: Dish.mock())
    }
    
}
