//
//  CustomTextFieldBackgroundStyle.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 9/29/22.
//

import Foundation
import SwiftUI

struct CustomTextFieldBackgroundStyle: TextFieldStyle {
    func _body(configuration: TextField<_Label>) -> some View {
            configuration
            .padding(.horizontal, 10)

            .frame(height: 40.0)
            .background(Color(red: 239/255, green: 243/255, blue: 244/255))
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.fieldBackgroundColor.opacity(0.3), lineWidth: 1)
            )
            .cornerRadius(8)
        
    }
}
