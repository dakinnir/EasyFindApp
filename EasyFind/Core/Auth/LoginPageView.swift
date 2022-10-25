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
    
    @State private var error: String?
    @State private var showAlert: Bool = false

    @State private var showSignUpScreen = false
    @State private var showHomePageScreen = false
    @State private var showForgotPasswordPageScreen = false
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    
                    // welcome back text, message, & forms
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading, spacing: 10) {
                            // title text
                            Text("\(Constants.welcomeBackText), user.")
                                .font(.title)
                                .fontWeight(.semibold)
                            // login message
                            Text(Constants.loginMessage)
                                .font(.system(size: 14))
                                .foregroundColor(.secondary)
                        }
                        .padding(.bottom, 40)
                        
                        // form fields & button
                        VStack {
                            
                            formFieldsSection
                            
                            forgotPasswordButton
                        
                            loginButton
                        }
                        .padding(.bottom, 40)
                        
                    }
                    Spacer()
                    
                    // new User? regiseter option button
                    registerOptionButton
                }
            }
            
            .alert("Error with Log In", isPresented: $showAlert, actions: {
                Text("OK")
            }, message: {
                Text(self.error ?? "")
            })
            .onTapGesture {
                
            }
            
            .padding()
            .fullScreenCover(isPresented: $showForgotPasswordPageScreen, content: {
                ForgotPasswordPageView()
            })
        .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    
    // MARK: - Form Fields Section
    private var formFieldsSection: some View {
        VStack {
            CustomInputField(entryText: $userLoginViewModel.userEmail, placeHolderText: "Email")
            
            CustomInputField(entryText: $userLoginViewModel.password, placeHolderText: "Password", isSecureEntry: true)
        }
    }
    
    // MARK: -  Forgot Password Button
    private var forgotPasswordButton: some View {
        HStack {
            Spacer()
            // forget password button
            Button {
                // destination
                showForgotPasswordPageScreen.toggle()
            } label: {
                Text(Constants.forgotPasswordText)
                    .foregroundColor(.mainColor)
                    .fontWeight(.medium)
                
            }
        }
    }
    
    // MARK: -  Login Button
    private var loginButton: some View {
        Button {
            // action
            authViewModel.loginUser(withEmail: userLoginViewModel.userEmail, withPassword: userLoginViewModel.password) { result in
                if let err = result {
                    self.error = err
                    showAlert.toggle()
                }
            }
        } label: {
            
            Text(Constants.loginText)
                .foregroundColor(.init(uiColor: .systemBackground))
                .fontWeight(.semibold)
                .frame(minWidth: 0, maxWidth: .infinity)
            
        }
        .padding()
        // reduce button color opacity until user has entered all fields
        .background(userLoginViewModel.validEntries ? Color.mainColor : Color.mainColor.opacity(0.4))
        .cornerRadius(10)
        .padding(.top)
        .disabled(
            !userLoginViewModel.validEntries
        )
    }
    // MARK: -  Register Option Button
    private var registerOptionButton: some View {
        HStack {
            Text(Constants.noAccountText)
                .font(.subheadline)
                .foregroundColor(.secondary)
            NavigationLink {
                SignUpPageView()
            } label: {
                Text("Register")
                    .foregroundColor(.mainColor)
                    .fontWeight(.medium)
            }
            
        }
    }
}


struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}

