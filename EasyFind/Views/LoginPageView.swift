//
//  LoginPageView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 9/28/22.
//

import SwiftUI

struct LoginPageView: View {
    
    private enum Field: Int, CaseIterable {
        case username, password
    }
    
    // MARK: - Properties
    @ObservedObject private var userLoginViewModel = UserLoginViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showSignUpScreen = false
    @State private var showHomePageScreen = false
    
    @FocusState private var focusedField: Field?

    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 40) {

            
            // MARK: - Form
            VStack(alignment: .leading) {

                Spacer()
                
                
                VStack(alignment: .leading) {
                    Text("Login")
                        .font(.title)
                    // MARK: - Form Fields & Buttons
                    VStack {
                        
                        FormEntryField(entryText: $userLoginViewModel.userEmail, placeHolderText: "Email",  isSecureEntry: false)
                            .focused($focusedField, equals: .username)

                        
                        
                        FormEntryField(entryText: $userLoginViewModel.password, placeHolderText: "Password", isSecureEntry: true)
                            .focused($focusedField, equals: .password)
                        
                        HStack {
                            Spacer()
                            // Forget Password Button
                            Button {
                                // Actions
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
                                .foregroundColor(.white)
                                .fontWeight(.semibold)
                                .frame(minWidth: 0, maxWidth: .infinity)

                        }
                        .padding()
                        .background(Color.mainColor)
                        .cornerRadius(10)
                        .padding(.top)
                    }
                }
                Spacer()
            }
            
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
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    focusedField = nil
                }
            }
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
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}


