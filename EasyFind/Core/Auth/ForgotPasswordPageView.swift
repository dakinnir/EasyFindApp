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
                        
            Spacer()

            VStack(alignment: .leading) {
                // page title & message
                headerSection
                    .padding(.bottom, 40)
                
                // form fields & buttons
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
    
    // MARK: - Close Page Button
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
    
    // MARK: - Page Title & Message
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(Constants.forgotPasswordText.capitalized)
                .font(.title)
                .fontWeight(.semibold)
            
            Text(Constants.forgotPasswordMessage)
                .font(.system(size: 14))
                .foregroundColor(.secondary)
        }
    }
    
    // MARK: - Email Form Section
    private var formFieldSection: some View {
        CustomInputField(entryText: $userEmailAddress, placeHolderText: "Email")
                    
    }
    // MARK: - Submit Email Buttton
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
        .background(
            !userEmailAddress.isEmpty ? Color.mainColor : Color.mainColor.opacity(0.4)
        )
        .cornerRadius(10)
        .disabled(
            userEmailAddress.isEmpty
        )
    }

}

struct ForgotPasswordPageView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordPageView()
            .environmentObject(AuthenticationViewModel())
    }
}
