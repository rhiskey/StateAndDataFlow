//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by brubru on 21.02.2022.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    private let user = DataManager.shared.load()
    
    var body: some Scene {
        WindowGroup {
           StarterView()
                .environmentObject(UserManager(user: user))
        }
    }
}
