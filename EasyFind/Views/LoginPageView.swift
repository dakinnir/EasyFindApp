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
    

    @State private var showSignUpScreen = false
    @State private var showHomePageScreen = false
    @State private var showForgotPasswordPageScreen = false
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(Constants.loginText.capitalized)
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text(Constants.loginMessage)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.bottom, 40)
                    // MARK: - Form Fields & Buttons
                    VStack {
                        
                        formFieldsSection
                        
                        forgotPasswordButton
                    
                        loginButton
                    }
                    .padding(.bottom, 40)
                    
                }
                Spacer()
                
                // MARK: - New User? Regiseter Option Button
                registerOptionButton
            }
        }
        .onTapGesture {
            
        }
        
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading:
                                Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.backward")
                .foregroundColor(.mainColor)
        })
        
        .padding()
        .fullScreenCover(isPresented: $showSignUpScreen) {
            SignUpPageView()
                .transition(.move(edge: .leading))
            
        }
        .fullScreenCover(isPresented: $showHomePageScreen, content: {
            ContentView()
        })
        
        .fullScreenCover(isPresented: $showForgotPasswordPageScreen, content: {
            ForgotPasswordPageView()
        })
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    // Form View
    private var formFieldsSection: some View {
        VStack {
            FormEntryField(entryText: $userLoginViewModel.userEmail, placeHolderText: "Email")
            
            FormEntryField(entryText: $userLoginViewModel.password, placeHolderText: "Password", isSecureEntry: true)
        }
    }
    
    // Forgot Password Button View
    private var forgotPasswordButton: some View {
        HStack {
            Spacer()
            // Forget Password Button
            
            Button {
                // Destination
                showForgotPasswordPageScreen.toggle()
            } label: {
                Text(Constants.forgotPasswordText)
                    .foregroundColor(.mainColor)
                    .fontWeight(.medium)
                
            }
        }
    }
    
    // Login Button

    private var loginButton: some View {
        Button {
            // Actions
            authViewModel.loginUser(withEmail: userLoginViewModel.userEmail, withPassword: userLoginViewModel.password)
        } label: {
            Text(Constants.loginText)
                .foregroundColor(.init(uiColor: .systemBackground))
                .fontWeight(.semibold)
                .frame(minWidth: 0, maxWidth: .infinity)
            
        }
        .padding()
        .background(Color.mainColor)
        .cornerRadius(10)
        .padding(.top)
    }
    
    private var registerOptionButton: some View {
        HStack {
            Text(Constants.noAccountText)
                .font(.subheadline)
                .foregroundColor(.secondary)
            Button {
                showSignUpScreen.toggle()
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


