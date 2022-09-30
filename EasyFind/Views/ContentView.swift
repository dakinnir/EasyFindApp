//
//  ContentView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 9/18/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        TabView {
            ExplorePageView()
                .tabItem {
                Image(systemName: "hand.tap.fill")
                Text("Explore")
            }
            Text("Bookmark Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded)) .tabItem {
                    Image(systemName: "bookmark.circle.fill")
                    Text("Bookmark")
                }
            Text("Recommendations Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded)) .tabItem {
                    Image(systemName: "star.circle.fill")
                    Text("Recommendations")
                }
            
            Text("Notifications Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded)) .tabItem {
                    Image(systemName: "bell.circle.fill")
                    Text("Notifications")
                }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExplorePageView: View {
    
    @State private var searchEntry: String = ""
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(text: $searchEntry, searchBarPlaceholderText: "Search...")
                Spacer()
                Text("Explore Tab")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                Spacer()
            }
        }
    }
}


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
