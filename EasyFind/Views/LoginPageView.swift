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
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showSignUpScreen = false
    @State private var showHomePageScreen = false
    @State private var showForgotPasswordPageScreen = false
    
    
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
                        
                        FormEntryField(entryText: $userLoginViewModel.userEmail, placeHolderText: "Email",  isSecureEntry: false)
                        
                        FormEntryField(entryText: $userLoginViewModel.password, placeHolderText: "Password", isSecureEntry: true)
                        
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
                        
                        // Login Button
                        Button {
                            // Actions
                            showHomePageScreen.toggle()
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
                    .padding(.bottom, 40)
                    
                }
                Spacer()
                
                
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
}


struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}


