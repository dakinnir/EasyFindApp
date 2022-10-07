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
    @EnvironmentObject var authViewModel: AuthenticationViewModel

    @Environment(\.presentationMode) var presentationMode
    @State private var showLoginScreen = false
    @State private var error: String?
    @State private var showAlert: Bool = false
    
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
        // Alert when there's an error creating new user
        .alert("Error with Log In", isPresented: $showAlert, actions: {
            Text("OK")
        }, message: {
            Text(self.error ?? "")
        })
        
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
            
            CustomInputField(entryText: $userSignUpViewModel.name, placeHolderText: "Name")

            CustomInputField(entryText: $userSignUpViewModel.userEmail, placeHolderText: "Email")
            
            CustomInputField(entryText: $userSignUpViewModel.password, placeHolderText: "Password", isSecureEntry: true)
            
            CustomInputField(entryText: $userSignUpViewModel.confirmPassword, placeHolderText: "Confirm password", isSecureEntry: true)
        }
    }
    
    private var signUpButton: some View {
        Button {
            // Actions
            
            authViewModel.registerUser(withName: userSignUpViewModel.name, withEmail: userSignUpViewModel.userEmail, withPassword: userSignUpViewModel.password) { result in
                if let error = result {
                    self.error = error
                    showAlert.toggle()
                }
            }
        } label: {
            Text(Constants.signUpText)
                .foregroundColor(.init(uiColor: .systemBackground))
                .fontWeight(.semibold)
                .frame(minWidth: 0, maxWidth: .infinity)
        }
        .padding()
        .background(
            userSignUpViewModel.validEntries ? Color.mainColor : Color.mainColor.opacity(0.4))
        .cornerRadius(10)
        .disabled(
            !userSignUpViewModel.validEntries
        )
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
