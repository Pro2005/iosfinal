//
//  Header.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-06-10.
//

import SwiftUI

struct Header: View {
    private let coreDataContextProvider: CoreDataContextProvider
    
    init(coreDataContextProvider: CoreDataContextProvider) {
        self.coreDataContextProvider = coreDataContextProvider
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Image("Logo")
                    HStack {
                        Spacer()
                        NavigationLink(destination: UserView(coreDataContextProvider: coreDataContextProvider)) {
                            Image(systemName:"person.crop.circle.fill")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(maxHeight: 30)
                                .padding(.trailing)
                        }
                    }
                }
            }
        }
        .frame(maxHeight: 50)
    }
}

#Preview {
    Header(coreDataContextProvider: MockCoreDataContextProvider())
}
