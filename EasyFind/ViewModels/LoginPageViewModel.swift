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

}
