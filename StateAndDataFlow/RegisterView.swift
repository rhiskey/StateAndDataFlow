//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by brubru on 21.02.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var user: UserManager
    @State private var name = ""
    @State private var symbolsColor = Color.red
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                Spacer()
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                Text("\(name.count)")
                    .foregroundColor(symbolsColor)
                    .padding(.trailing)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }.disabled(!checkName())
        }
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

extension RegisterView {
    private func checkName() -> Bool {
        if name.count > 3 {
            DispatchQueue.main.async {
                symbolsColor = Color.green
            }
            return true
        } else {
            DispatchQueue.main.async {
                symbolsColor = Color.red
            }
            return false
        }
    }
}

extension RegisterView {
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegister.toggle()
            
            StorageManager().userName = name
            StorageManager().isRegisterUser.toggle()
        }
    }
}
