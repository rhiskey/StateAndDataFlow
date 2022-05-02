//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by brubru on 21.02.2022.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject private var userManager: UserManager
    
    var body: some View {
        VStack {
            
            UserNameTF(
                name: $userManager.user.name,
                isNameValid: userManager.isNameValid
            )
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }.disabled(!userManager.isNameValid)
        }
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

extension RegisterView {
    private func registerUser() {
        if !userManager.user.name.isEmpty {
            userManager.user.isRegistered.toggle()
            DataManager.shared.save(user: userManager.user)
        }
    }
}

struct UserNameTF: View {
    
    @Binding var name: String
    var isNameValid = false
    
    var body: some View {
        ZStack {
            TextField("Enter your name...", text: $name)
                .multilineTextAlignment(.center)
            
            HStack {
                Spacer()
                Text("\(name.count)")
                    .foregroundColor(isNameValid ? .green : .red)
                .padding([.top, .trailing])
            }
            .padding(.bottom)
        }
    }
}
