//
//  LoginPageViewModel.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 9/28/22.
//

import Foundation


class UserLoginViewModel: ObservableObject {
    
    @Published var userEmail: String = ""
    @Published var password: String = ""

    // Return true if all fields are satisfied
    var validEntries: Bool {
        return !userEmail.isEmpty && !password.isEmpty
    }
}
