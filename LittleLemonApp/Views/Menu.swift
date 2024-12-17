//
//  Menu.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-05-30.
//

import SwiftUI
import CoreData

struct Menu: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @State var isKeyboardVisible = false
    
    init() {
        UITextField.appearance().clearButtonMode = .whileEditing
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    if !isKeyboardVisible {
                        withAnimation() {
                            Hero()
                                .frame(maxHeight: 170)
                        }
                        
                    }
                    TextField("Search menu", text: $viewModel.search)
                        
                        .textFieldStyle(.roundedBorder)
                }
                .padding()
                .background(Color.primaryColor1)
                
                Text("ORDER FOR DELIVERY!")
                    .font(.sectionTitle())
                    .foregroundColor(.highlightColor2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.leading)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(viewModel.categories, id: \.self) { category in
                            Toggle(category, isOn: viewModel.makeBinding(for: category))
                        }
                    }
                    .toggleStyle(MyToggleStyle())
                    .padding(.horizontal)
                }
                List(viewModel.dishes) { dish in
                        NavigationLink(destination: DetailFoodItem(dish: dish)) {
                            FoodItem(dish: dish)
                        }
                    }
                    .listStyle(.plain)
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { notification in
            withAnimation {
                self.isKeyboardVisible = true
            }
            
        }
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { notification in
            withAnimation {
                self.isKeyboardVisible = false
            }
        }
    }
    
}

#Preview {
    Menu()
}
