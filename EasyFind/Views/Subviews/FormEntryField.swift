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
        
        VStack(alignment: .leading) {
                    
            // Display secure entry field or the normal based on the isSecureEntry property
            if !isSecureEntry {
                TextField(placeHolderText, text: $entryText)
            } else {
                SecureField(placeHolderText, text: $entryText)
            }
            Divider()
                .foregroundColor(.secondary)
        }
        .padding(.vertical)
    }
}


struct FormEntryField_Previews: PreviewProvider {
    static var previews: some View {
        FormEntryField(entryText: .constant("Password"), placeHolderText: "Password", isSecureEntry: true)
    }
}
