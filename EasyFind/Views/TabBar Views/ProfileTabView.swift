//
//  ProfilePageView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 10/4/22.
//

import SwiftUI

enum ProfileTabMenuItems: String, CaseIterable {
    case account = "account"
    case settings = "settings"
    case help = "help"
    case privacy = "privacy"
    case logout = "logout"
    
    var description: String {
        return self.rawValue.capitalized
    }
}
                                
                                
struct ProfileTabView: View {
    
    // MARK: - Properties
    @EnvironmentObject var authViewModel: AuthenticationViewModel

    private let profileLinkNames = ProfileTabMenuItems.allCases
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                List(profileLinkNames, id: \.self) { item in
                    if item == .logout {
                        Button {
                            DispatchQueue.main.async {
                                authViewModel.logoutUser()
                            }
                        } label: {
                            Text(item.description)
                                .font(.body)
                        }
                    } else {
                        NavigationLink {
                            Text(item.description)
                        } label: {
                            Text(item.description)
                                .font(.body)
                        }
                    }
                }
                .listStyle(.inset)
            }
            
            .toolbar(content: {
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
