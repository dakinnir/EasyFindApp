//
//  SignUpPageView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 9/28/22.
//

import SwiftUI

struct SignUpPageView: View {

    // MARK: Properties
    @ObservedObject private var userSignUpViewModel = UserSignUpViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showLoginScreen = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            // MARK: - Form Fields
            VStack(alignment: .leading) {
                
                Text(Constants.createAccount)
                    .font(.title)
                    .fontWeight(.semibold)

                VStack(spacing: 30) {
                    VStack(alignment: .leading) {
                        
                        FormEntryField(entryText: $userSignUpViewModel.name, placeHolderText: "Name", isSecureEntry: false)

                        FormEntryField(entryText: $userSignUpViewModel.userEmail, placeHolderText: "Email", isSecureEntry: false)
                        
                        FormEntryField(entryText: $userSignUpViewModel.password, placeHolderText: "Password", isSecureEntry: true)
                        
                        FormEntryField(entryText: $userSignUpViewModel.confirmPassword, placeHolderText: "Confirm password", isSecureEntry: true)
                    }
                    
                    // Sign Up Button
                    Button {
                        // Actions
                    } label: {
                        Text(Constants.signUpText)
                            .foregroundColor(.init(uiColor: .systemBackground))
                            .fontWeight(.semibold)
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .padding()
                    .background(Color.mainColor)
                    .cornerRadius(10)
                }
            }
            
            Spacer()
            
            // Option: User can click login if they already have an account
            HStack {
                Text(Constants.alreadyUser)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Button {
                    showLoginScreen.toggle()
                } label: {
                    Text(Constants.loginText)
                        .foregroundColor(.mainColor)
                        .fontWeight(.medium)
                }
            }
        }
        // Use to dismiss the keyboard when the the view is tapped
        .onTapGesture {
            self.endEditing()
        }
        .padding()
        .fullScreenCover(isPresented: $showLoginScreen, content: {
            LoginPageView()                .transition(.move(edge: .trailing))

            
        })
    }
}

struct SignUpPageView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPageView()
    }
}
