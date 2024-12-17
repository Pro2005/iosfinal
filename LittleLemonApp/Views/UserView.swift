//
//  UserView.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-06-10.
//

import SwiftUI

struct UserView: View {
    @StateObject var viewModel: UserViewModel
    private let coreDataContextProvider: CoreDataContextProvider
    @Environment(\.presentationMode) var presentation

    
    init(coreDataContextProvider: CoreDataContextProvider) {
        self.coreDataContextProvider = coreDataContextProvider
        _viewModel = StateObject(wrappedValue: .init(coreDataContextProvider: coreDataContextProvider))
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 5) {
                    VStack {
                        Text("Avatar")
                            .onboardingTextStyle()
                        HStack(spacing: 0) {
                            Image("avatarPlaceholder")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(maxHeight: 75)
                                .clipShape(Circle())
                                .padding(.trailing)
                            Button("Change") { }
                                .buttonStyle(ButtonStylePrimaryColor1())
                            Button("Remove") { }
                                .buttonStyle(ButtonStylePrimaryColorReverse())
                            Spacer()
                        }
                    }
                    
                    VStack{
                        Text("First name")
                            .onboardingTextStyle()
                        TextField("First name", text: $viewModel.firstName)
                    }
                    
                    VStack {
                        Text("Last name")
                            .onboardingTextStyle()
                        TextField("Last name", text: $viewModel.lastName)
                        
                    }
                    
                    VStack {
                        Text("Email")
                            .onboardingTextStyle()
                        TextField("Email", text: $viewModel.email)
                            .keyboardType(.emailAddress)
                    }
                    
                    VStack {
                        Text("Phone number")
                            .onboardingTextStyle()
                        TextField("Phone number", text: $viewModel.phoneNumber)
                            .keyboardType(.default)
                    }
                }
                .textFieldStyle(.roundedBorder)
                .disableAutocorrection(true)
                .padding()
                
                Text("Email notifications")
                    .font(.regularText())
                    .foregroundColor(.primaryColor1)
                VStack {
                    Toggle("Order statuses", isOn: $viewModel.orderStatus)
                    Toggle("Critical updates", isOn: $viewModel.criticalUpdates)
                    Toggle("Special offers", isOn: $viewModel.specialOrder)
                    Toggle("Newsletter", isOn: $viewModel.newsLetter)
                }
                .padding()
                .font(Font.leadText())
                .foregroundColor(.primaryColor1)
                
                Button("Log out") {
                    viewModel.logout()
                }
                .buttonStyle(ButtonStyleYellowColorWide())
                Spacer(minLength: 20)
                HStack {
                    Button("Discard Changes") {
                        self.presentation.wrappedValue.dismiss()
                    }
                    .buttonStyle(ButtonStylePrimaryColorReverse())
                    Button("Save changes") {
                        viewModel.save()
                        self.presentation.wrappedValue.dismiss()
                    }
                    .buttonStyle(ButtonStylePrimaryColor1())
                }
                
            }
            .navigationTitle(Text("Personal information"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $viewModel.isLoggedOut) {
                Onboarding(coreDataContextProvider: coreDataContextProvider)
            }
//            .tint(Color.primaryColor1)
        }
    }
    
}

#Preview {
    UserView(coreDataContextProvider: MockCoreDataContextProvider())
}
