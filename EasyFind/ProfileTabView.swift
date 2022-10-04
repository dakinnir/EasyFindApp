//
//  ProfileTabView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 9/30/22.
//

import SwiftUI

struct ProfileTabView: View {
    
    let profileLinkNames: [String] = ["Account", "Bookmarks", "Work History", "Help", "Logout"]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                List(profileLinkNames, id: \.self) { name in
                    NavigationLink {
                        Text("Hello")
                    } label: {
                        Text(name)
                            .font(.body)
                    }
                }
                .listStyle(.inset)
            }
            
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading, content: {
                    // Text("Premium Member")
                    Text("Painter")
                        .font(.body)
                        .foregroundColor(Color(.systemGray))
                })
                
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Image("painter")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle()) // Clip the image to a circle
                })
            })
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ProfileTabView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTabView()
    }
}
