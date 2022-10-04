//
//  ExploreTabView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 10/4/22.
//

import SwiftUI

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
struct ExplorePageView_Previews: PreviewProvider {
    static var previews: some View {
        ExplorePageView()
    }
}
