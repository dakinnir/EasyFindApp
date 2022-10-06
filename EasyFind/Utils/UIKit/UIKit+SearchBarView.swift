//
//  SearchBarView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 10/4/22.
//

import Foundation
import SwiftUI
import UIKit

struct SearchBarView: UIViewRepresentable {
    
    @Binding var text: String
    var searchBarPlaceholderText: String

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        searchBar.placeholder = searchBarPlaceholderText
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}
