//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Владимир Киселев on 01.05.2022.
//

import SwiftUI

struct StorageManager {
    @AppStorage("name") var userName: String = "User"
    @AppStorage("isRegister") var isRegisterUser: Bool = false
}
