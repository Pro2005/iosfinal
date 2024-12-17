//
//  LittleLemonAppApp.swift
//  LittleLemonApp
//
//  Created by Denysov Illia on 2024-05-30.
//

import SwiftUI

@main
struct LittleLemonAppApp: App {
    @StateObject var coreDataPersistent = CoreDataPersistent(containerName: "Model")
    var body: some Scene {
        WindowGroup {
            Onboarding(coreDataContextProvider: coreDataPersistent)
        }
    }
}
