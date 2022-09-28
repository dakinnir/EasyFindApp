//
//  SignUpPageViewModel.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 9/28/22.
//

import Foundation

class UserSignUpViewModel: ObservableObject {
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var userEmail: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""

}
