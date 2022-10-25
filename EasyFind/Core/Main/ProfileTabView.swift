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
        VStack {
            VStack(spacing: 20) {
                VStack {
                    Image("painter")
                        .resizable()
                        .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    
                    Text("Daniel Akinniranye")
                        .font(.system(size: 20, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(.mainColor)
                } // Clip the image to a circle
                
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
            .padding(.top, 40)
        }
    }
}

struct ProfileTabView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTabView()
    }
}
