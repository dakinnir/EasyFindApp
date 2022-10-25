//
//  TextView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 10/19/22.
//

import Foundation
import UIKit
import SwiftUI

struct TextView: UIViewRepresentable {
 
    @Binding var text: String
    var placeholderText: String
    @Binding var didStartEditing: Bool
    @Binding var desiredHeight: CGFloat

    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        
        textView.delegate = context.coordinator
        textView.font = UIFont.preferredFont(forTextStyle: .body)
        textView.autocapitalizationType = .sentences
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
        return textView
    }
 
    func updateUIView(_ uiView: UITextView, context: Context) {
        if didStartEditing {
            uiView.textColor = UIColor.black
            uiView.text = text
        }
        else {
            uiView.text = placeholderText
            uiView.textColor = UIColor.lightGray
        }
        uiView.font = UIFont.preferredFont(forTextStyle: .body)

        // Compute the desired height for the content
        let fixedWidth = uiView.frame.size.width
        let newSize = uiView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))

        DispatchQueue.main.async {
            self.desiredHeight = newSize.height
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator($text)
    }

    class Coordinator: NSObject, UITextViewDelegate {
        var text: Binding<String>
     
        init(_ text: Binding<String>) {
            self.text = text
        }
     
        func textViewDidChange(_ textView: UITextView) {
            self.text.wrappedValue = textView.text
        }
    }
}


class Coordinator: NSObject, UITextViewDelegate {
    var text: Binding<String>
 
    init(_ text: Binding<String>) {
        self.text = text
    }
 
    func textViewDidChange(_ textView: UITextView) {
        self.text.wrappedValue = textView.text
    }
}

