//
//  Onboarding.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-05-30.
//

import SwiftUI

extension TextField {
    func applyStyle() -> some View {
        padding(3).border(.black).cornerRadius(2.0)
    }
}

struct Onboarding: View {
    private let coreDataContextProvider: CoreDataContextProvider
    @StateObject var viewModel: OnboardingViewModel
    @State var contentOffset: CGSize = .zero
    @State var isKeyboardVisible = false
    private let maxHeight: CGFloat = 340
    private let contentOffsetCorrection: CGFloat = 50
    
    init(coreDataContextProvider: CoreDataContextProvider) {
        self.coreDataContextProvider = coreDataContextProvider
        _viewModel = StateObject(wrappedValue: .init(coreDataContextProvider: coreDataContextProvider))
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Hero()
                    VStack {
                        if viewModel.isFirstNameAvailable {
                            Text("First name")
                                .onboardingTextStyle()
                            TextField("First name", text: $viewModel.firstName)
                        }
                        if viewModel.isLastNameAvailable {
                            Text("Last name")
                                .onboardingTextStyle()
                            TextField("Last name", text: $viewModel.lastName)
                        }
                        if viewModel.isEmailAvailable {
                            Text("Email")
                                .onboardingTextStyle()
                            TextField("Email", text: $viewModel.email)
                                .keyboardType(.emailAddress)
                        }
                        if viewModel.isPhoneNumberAvailable {
                            Text("Phone number")
                                .onboardingTextStyle()
                            TextField("Phone number", text: $viewModel.phoneNumber).keyboardType(.phonePad)
                        }
                    }
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
                    .padding()
                    
                    if let message = viewModel.errorMessage {
                        withAnimation() {
                            Text(message)
                                .foregroundColor(.red)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                        }
                    }
                    
                    Button(viewModel.isLastPage ? "Register" : "Next") {
                        viewModel.save()
                        viewModel.next()
                    }
                    .buttonStyle(ButtonStyleYellowColorWide())
                    Spacer()
                }
                .offset(y: contentOffset.height)
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { notification in
                    withAnimation {
                        let keyboardRect = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                        let keyboardHeight = keyboardRect.height
                        self.isKeyboardVisible = true
                        self.contentOffset = CGSize(width: 0, height: -keyboardHeight / 2 + contentOffsetCorrection)
                    }
                    
                }
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { notification in
                    withAnimation {
                        self.isKeyboardVisible = false
                        self.contentOffset = .zero
                    }
                }
                .navigationDestination(isPresented: $viewModel.isFinished, destination: {Home(coreDataContextProvider: coreDataContextProvider).environmentObject(HomeViewModel(coreDataContextProvider: coreDataContextProvider)).environmentObject(viewModel)})
            }
            .onAppear() {
                viewModel.start()
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .toolbar{
                ToolbarItem(placement: .principal) {
                    Image("Logo")
                }
                if viewModel.isReturnAvailable {
                    ToolbarItem(placement: .cancellationAction) {
                        CustomBackButton {
                            viewModel.back()
                        }
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    Onboarding(coreDataContextProvider: MockCoreDataContextProvider())
}
