//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by brubru on 21.02.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var user: UserManager
    @AppStorage("name") private var name = ""
    // var name: String = ""
    @State private var symbolsCount = "0"
    @State private var symbolsColor = Color.red
    
    var body: some View {
        VStack {
            
            HStack {
                Spacer()
                Spacer()
                TextField("Enter your name...", text: $name) { _ in
                    withAnimation {
                        checkName()
                    }
                }.multilineTextAlignment(.center)
                    .onChange(of: _name, perform: checkName())

                Text(symbolsCount)
                    .foregroundColor(symbolsColor)
                    .padding(.trailing)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }
        }
    }
}

extension RegisterView {
    private func checkName() {
        symbolsCount = "\(name.count)"
        if name.count > 3 {
            symbolsColor = Color.green
        }
        else {
            symbolsColor = Color.red
        }
    }
}

extension RegisterView {
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegister.toggle()
            name = name
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
