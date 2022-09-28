//
//  LoginPageView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 9/28/22.
//

import SwiftUI

struct LoginPageView: View {
    // MARK: - Properties
    @ObservedObject private var userLoginViewModel = UserLoginViewModel()
    
    
    // MARK: - Body
    var body: some View {
        VStack {
            Spacer()
            // Page Title
            Text(Constants.signInTitle)
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.medium)
                .foregroundColor(Color(Constants.purpleThemeColor))
                .padding()
            Spacer()
            
            // MARK: - Form
            VStack(alignment: .leading) {
                Text(Constants.loginMessage)
                    .foregroundColor(.secondary)
                FormEntryField(entryText: $userLoginViewModel.userEmail, placeHolderText: "Email", isSecureEntry: false)
                FormEntryField(entryText: $userLoginViewModel.password, placeHolderText: "Password", isSecureEntry: true)
                
                VStack {
                    // Forget Password Button
                    Button {
                        // Actions
                    } label: {
                        Text("Forgot password?")
                            .foregroundColor(.mainColor)
                    }
                    
                    // Login Button
                    Button {
                        // Actions
                    } label: {
                        Text("LOG IN")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .background(Color.mainColor)
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.bottom, 70)
            
            
            Spacer()

        }
        .padding()
        .navigationTitle("Sign In")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}


