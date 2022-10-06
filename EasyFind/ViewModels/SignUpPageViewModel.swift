//
//  SignUpPageViewModel.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 9/28/22.
//

import Foundation

class UserSignUpViewModel: ObservableObject {
    
    @Published var name: String = ""
    @Published var userEmail: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""

    // Return true if all fields are satisfied
    var validEntries: Bool {
        return !name.isEmpty && !userEmail.isEmpty && !password.isEmpty && !confirmPassword.isEmpty
    }
}
