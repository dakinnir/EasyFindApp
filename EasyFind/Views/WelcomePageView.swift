//
//  WelcomePageView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 9/27/22.
//

import SwiftUI

struct WelcomePageView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 15) {
                    Text("Welcome")
                        .foregroundColor(.mainColor)
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.medium)
                    Text("Please login or sign up to continue using our app.")
                        .font(.system(.subheadline))
                        .foregroundColor(.secondary)
                }

                Spacer()

                Image("painter")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                Spacer()
                
                VStack(spacing: 20) {
                    
                    NavigationLink {
                        Text("Sign up page")
                    } label: {
                        Text("Sign up")
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.mainColor)
                            .cornerRadius(8)
                    }

                    
                    HStack {
                        Text("You already have an account?")
                            .foregroundColor(.secondary)
                        NavigationLink {
                            Text("Login page")
                        } label: {
                            Text("Login")
                                .foregroundColor(.mainColor)
                        }

                    }
                }
            }
            .padding()
        }
    }
}

struct WelcomePageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView()
    }
}
