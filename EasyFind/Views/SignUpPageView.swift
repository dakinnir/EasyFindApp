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
            
            VStack(alignment: .leading) {
                
                // MARK: - Page Title
                Text(Constants.createAccount)
                    .font(.title)
                    .fontWeight(.semibold)

                // MARK: - Form Section & Button
                VStack(spacing: 30) {
                    formFieldsSection
                    
                    signUpButton
                }
            }
            
            Spacer()
            
            // MARK: - Already A User? Login Option Button
            loginOptionButton
        }
        // Use to dismiss the keyboard when anywhere on the view is tapped
        .onTapGesture {
            
        }
        .padding()
        .fullScreenCover(isPresented: $showLoginScreen, content: {
            LoginPageView()                .transition(.move(edge: .trailing))

            
        })
    }
    
    private var formFieldsSection: some View {
        VStack(alignment: .leading) {
            
            FormEntryField(entryText: $userSignUpViewModel.name, placeHolderText: "Name", isSecureEntry: false)

            FormEntryField(entryText: $userSignUpViewModel.userEmail, placeHolderText: "Email", isSecureEntry: false)
            
            FormEntryField(entryText: $userSignUpViewModel.password, placeHolderText: "Password", isSecureEntry: true)
            
            FormEntryField(entryText: $userSignUpViewModel.confirmPassword, placeHolderText: "Confirm password", isSecureEntry: true)
        }
    }
    
    private var signUpButton: some View {
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
    
    
    private var loginOptionButton: some View {
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
}

struct SignUpPageView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPageView()
    }
}
