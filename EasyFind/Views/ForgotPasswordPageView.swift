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
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                
                Image(systemName: "multiply")
                    .foregroundColor(.mainColor)
                    .font(.title)
            }
            Spacer()
            
            ZStack {
                
                // MARK: - Form Fields
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(Constants.forgotPasswordText.capitalized)
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text(Constants.forgotPasswordMessage)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.bottom, 40)
                    
                    VStack(spacing: 30) {
                        VStack(alignment: .leading) {
                            FormEntryField(entryText: $userEmailAddress, placeHolderText: "Email", isSecureEntry: false)
                        }
                        
                        // Sign Up Button
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
                    .padding(.bottom, 40)
                }
                
            }
            Spacer()
        }
        .onTapGesture {
            self.endEditing()
        }
        .padding()
    }
}
struct ForgotPasswordPageView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordPageView()
    }
}
