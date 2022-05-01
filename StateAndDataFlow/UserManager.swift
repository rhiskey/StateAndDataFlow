//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by brubru on 21.02.2022.
//

import Foundation
import Combine
import SwiftUI

class UserManager: ObservableObject {
    @Published var isRegister = StorageManager().isRegisterUser
    var name = StorageManager().userName
}
