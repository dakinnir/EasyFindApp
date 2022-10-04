//
//  ForgotPasswordPageView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 10/3/22.
//

import SwiftUI

struct ForgotPasswordPageView: View {
    
    private enum Field: Int, CaseIterable {
        case email
    }
    
    // MARK: Properties
    @Environment(\.presentationMode) var presentationMode
    
    @State var userEmailAddress = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            
            // MARK: - Close Button
            closeButton
            
            Spacer()

                VStack(alignment: .leading) {
                    // MARK: - Page Title & Message
                    headerSection
                        .padding(.bottom, 40)
                    
                    // MARK: - Form Fields & Button
                    VStack(spacing: 30) {
                        
                        formFieldSection
                    
                        submitButton
                    }
                    .padding(.bottom, 40)
                }
            Spacer()
        }
        .onTapGesture {
        }
        .padding()
    }
    
    // Close Page Button
    private var closeButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            
            Image(systemName: "multiply")
                .foregroundColor(.mainColor)
                .font(.title)
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
        FormEntryField(entryText: $userEmailAddress, placeHolderText: "Email", isSecureEntry: false)
    }
    
    // Submit Email Buttton
    private var submitButton: some View {
        Button {
            // Actions
        } label: {
            Text(Constants.submitText)
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
