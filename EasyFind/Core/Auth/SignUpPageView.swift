//
//  SignUpPageView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 9/28/22.
//

import SwiftUI

struct SignUpPageView: View {

    // MARK: Properties
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject private var userSignUpViewModel = UserSignUpViewModel()
    @State private var error: String?
    @State private var showAlert: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            VStack(spacing: 50) {
                VStack(alignment: .center, spacing: 10) {
                    Text(Constants.appName)
                        .font(.system(size: 40, design: .monospaced))
                        .fontWeight(.semibold)
                    Text(Constants.welcomeMessage)
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 80)
                }

                VStack(alignment: .leading) {
                    
                    // MARK: - Page Title
                    

                    // MARK: - Form Section & Button
                    VStack(spacing: 30) {
                        formFieldsSection
                        
                        signUpButton
                    }
                }
                Spacer()
            }
        }
        .padding()

        // Alert when there's an error creating new user
        .alert("Error with Log In", isPresented: $showAlert, actions: {
            Text("OK")
        }, message: {
            Text(self.error ?? "")
        })
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.backward")
                .foregroundColor(.mainColor)
        })
        
        // Use to dismiss the keyboard when anywhere on the view is tapped
        .onTapGesture {
            
        }
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
}

struct SignUpPageView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPageView()
    }
}
