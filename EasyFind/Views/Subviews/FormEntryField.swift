//
//  FormEntryField.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 9/28/22.
//

import SwiftUI

struct FormEntryField: View {
    
    // MARK: - Properties
    @Binding var entryText: String
    var placeHolderText: String
    var isSecureEntry: Bool
    
    // MARK: - Body
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {

            // Display secure entry field or the normal based on the isSecureEntry property
            if !isSecureEntry {
                
                TextField(placeHolderText, text: $entryText)
                    .font(.system(size: 15))
                    .textFieldStyle(CustomTextFieldBackgroundStyle())

                
            } else {
                SecureField(placeHolderText, text: $entryText)
                    .font(.system(size: 15))
                    .textFieldStyle(CustomTextFieldBackgroundStyle())
            }
        }
    }
}


struct FormEntryField_Previews: PreviewProvider {
    static var previews: some View {
        FormEntryField(entryText: .constant("Password"), placeHolderText: "Password", isSecureEntry: false)
    }
}
