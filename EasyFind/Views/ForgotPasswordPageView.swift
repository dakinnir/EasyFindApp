//
//  ForgotPasswordPageView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 10/3/22.
//

import SwiftUI

struct ForgotPasswordPageView: View {
    
    // MARK: Properties
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @State var userEmailAddress = ""
    @State var isValidEmail: Bool = false
    @State var buttonPressed: Bool = false
    
    var body: some View {
        VStack(alignment: .center) {
            
            // MARK: - Close Button
            
            Spacer()

            VStack(alignment: .leading) {
                // MARK: - Page Title & Message
                headerSection
                    .padding(.bottom, 40)
                
                // MARK: - Form Fields & Button
                VStack(spacing: 30) {
                    
                    formFieldSection
                        .overlay {
                            if (isValidEmail && buttonPressed) {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.green, lineWidth: 1)
                            } else if (!isValidEmail && buttonPressed) {
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.red, lineWidth: 1)
                            }
                        }
                    
                    if isValidEmail && buttonPressed {
                        Text("Password reset sent to your email address.")
                            .font(.subheadline)
                            .foregroundColor(Color.green)
                    } else if (!isValidEmail && buttonPressed) {
                        Text("Please enter a valid email address!")
                            .font(.subheadline)
                            .foregroundColor(Color.red)

                    }
                
                    VStack(alignment: .center, spacing: 15) {
                        if authViewModel.isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .mainColor))
                        }
                        resetPasswordButton
                    }
                                        
                }
            }
                    .padding(.bottom, 40)
            Spacer()

            loginBackButton
        }
        .onTapGesture {
            
        }
        .padding()
    }
    
    // Close Page Button
    private var loginBackButton: some View {
        HStack {
            Text("You remember your password?")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Log in")
                    .foregroundColor(.mainColor)
                    .fontWeight(.medium)
            }
        }
    }
    
    // Page Title & Message
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(Constants.forgotPasswordText.capitalized)
                .font(.title)
                .fontWeight(.semibold)
            
            Text(Constants.forgotPasswordMessage)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
    
    // Email Form Section
    private var formFieldSection: some View {
        CustomInputField(entryText: $userEmailAddress, placeHolderText: "Email")
                    
    }
    
    // Submit Email Buttton
    private var resetPasswordButton: some View {
        Button {
            // Actions
            
            authViewModel.forgotPassword(withEmail: userEmailAddress) { result in
                if let error = result {
                    isValidEmail = false
                    print(error)
                } else {
                    isValidEmail = true
                }
                buttonPressed = true
            }
        } label: {
            Text(Constants.resetButtonText)
                .foregroundColor(.init(uiColor: .systemBackground))
                .fontWeight(.semibold)
                .frame(minWidth: 0, maxWidth: .infinity)
                
        }
        .padding()
        .background(Color.mainColor)
        .cornerRadius(10)
    }

}

struct ForgotPasswordPageView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordPageView()
    }
}
