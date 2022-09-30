//
//  SignUpPageView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 9/28/22.
//

import SwiftUI

struct SignUpPageView: View {
    
    private enum Field: Int, CaseIterable {
        case name, email, password, confirmPassword
    }
    
    // MARK: Properties
    @ObservedObject private var userSignUpViewModel = UserSignUpViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    @State private var showLoginScreen = false
    
    @FocusState private var focusedField: Field?

    var body: some View {
        VStack {
            
            Spacer()
            
            // MARK: - Form Fields
            VStack(alignment: .leading) {
                
                Text(Constants.createAccount)
                    .font(.title)
                
                VStack(spacing: 30) {
                    VStack(alignment: .leading) {
                        
                        FormEntryField(entryText: $userSignUpViewModel.name, placeHolderText: "Name", isSecureEntry: false)
                            .focused($focusedField, equals: .name)

                        
                        FormEntryField(entryText: $userSignUpViewModel.userEmail, placeHolderText: "Email", isSecureEntry: false)
                            .focused($focusedField, equals: .email)

                        
                        FormEntryField(entryText: $userSignUpViewModel.password, placeHolderText: "Password", isSecureEntry: true)
                            .focused($focusedField, equals: .password)

                        
                        FormEntryField(entryText: $userSignUpViewModel.confirmPassword, placeHolderText: "Confirm password", isSecureEntry: true)
                            .focused($focusedField, equals: .confirmPassword)

                    }
                    
                    // Sign Up Button
                    Button {
                        // Actions
                    } label: {
                        Text(Constants.signUpText)
                            .foregroundColor(.white)
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
        // Use to dismiss the keyboard when the done button at the top of keyboard is hit
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    focusedField = nil
                }
            }
        }
        .padding()
        .fullScreenCover(isPresented: $showLoginScreen, content: {
            LoginPageView()                .transition(.move(edge: .trailing))

            
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SignUpPageView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPageView()
    }
}
