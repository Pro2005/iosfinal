//
//  Home.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-05-30.
//

import SwiftUI

struct Home: View {
    private let coreDataContextProvider: CoreDataContextProvider
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    init(coreDataContextProvider: CoreDataContextProvider) {
        self.coreDataContextProvider = coreDataContextProvider
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Header(coreDataContextProvider: coreDataContextProvider)
                Menu()
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    Home(coreDataContextProvider: MockCoreDataContextProvider())
}
