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
                Image(systemName: "magnifyingglass.circle.fill")
                Text("Explore")
            }
//            Text("Bookmark Tab")
//                .font(.system(size: 30, weight: .bold, design: .rounded)) .tabItem {
//                    Image(systemName: "bookmark.circle.fill")
//                    Text("Bookmark")
//                }
            
            Text("Messages Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded)) .tabItem {
                    Image(systemName: "envelope")
                    Text("Messages")
                }
            
            Text("Work Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded)) .tabItem {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Work")
                }
            
            Text("Notifications Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded)) .tabItem {
                    Image(systemName: "bell.circle.fill")
                    Text("Notifications")
                }
            
            ProfileTabView()
                .font(.system(size: 30, weight: .bold, design: .rounded)) .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Profile")
                }
        }
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
                    .padding(.horizontal)
                Spacer()
                Text("Explore Tab")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                Spacer()
            }
            .navigationTitle("Explore")
        }
    }
}


struct SearchBarView: UIViewRepresentable {
    
    @Binding var text: String
    var searchBarPlaceholderText: String

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .minimal
        searchBar.heightAnchor.constraint(equalToConstant: 40)
        searchBar.autocapitalizationType = .none
        searchBar.placeholder = searchBarPlaceholderText
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}
