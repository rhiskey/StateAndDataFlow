//
//  StarterView.swift
//  StateAndDataFlow
//
//  Created by brubru on 21.02.2022.
//

import SwiftUI

struct StarterView: View {
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        Group {
            if userManager.user.isRegistered {
                TimerView()
            } else {
                RegisterView()
            }
        }
    }
}

struct StarterVIew_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserManager())
    }
}
