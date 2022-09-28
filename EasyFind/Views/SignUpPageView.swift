//
//  SignUpPageView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 9/28/22.
//

import SwiftUI

struct SignUpPageView: View {
    
    @ObservedObject private var userSignUpViewModel = UserSignUpViewModel()
    var body: some View {
        VStack {

            Spacer()
            
            // MARK: - Form
            VStack(alignment: .leading) {
                Text(Constants.createAccount)
                    .foregroundColor(.secondary)
                    .padding(.vertical, 10)

                FormEntryField(entryText: $userSignUpViewModel.firstName, placeHolderText: "First Name", isSecureEntry: false)
                    .padding(.vertical, 10)

                FormEntryField(entryText: $userSignUpViewModel.lastName, placeHolderText: "Last Name", isSecureEntry: false)
                    .padding(.vertical, 10)

                FormEntryField(entryText: $userSignUpViewModel.userEmail, placeHolderText: "Email", isSecureEntry: false)
                    .padding(.vertical, 10)

                FormEntryField(entryText: $userSignUpViewModel.password, placeHolderText: "Password", isSecureEntry: true)
                    .padding(.vertical, 10)

                FormEntryField(entryText: $userSignUpViewModel.confirmPassword, placeHolderText: "Confirm Password", isSecureEntry: true)
                    .padding(.vertical, 10)


                
                    
                // Login Button
                Button {
                    // Actions
                } label: {
                    Text("SIGN UP!")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.mainColor)
                        .cornerRadius(10)
                }
                
            }
            .padding(.bottom, 70)

            Spacer()

        }
        .padding()
        .navigationTitle("Sign Up")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SignUpPageView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPageView()
    }
}
