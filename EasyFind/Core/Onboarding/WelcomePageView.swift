//
//  WelcomePageView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 9/27/22.
//

import SwiftUI
import UIKit

struct WelcomePageView: View {
    
    @State private var showSignUpScreen = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {

                Spacer()
                
                VStack(alignment: .center, spacing: 15) {
                    Text(Constants.appName)
                        .font(.system(size: 40, design: .monospaced))
                        .fontWeight(.semibold)
                    Text(Constants.welcomeMessage)
                        .font(.system(size: 17))
                        .foregroundColor(.secondary)
                        .lineLimit(4)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 50)
                    
                }
                Spacer()
                
                // Button Options
                VStack(spacing: 20) {
                    
                    Button {
                        showSignUpScreen.toggle()
                    } label: {
                        HStack {
                            Text(Constants.getStartedText)
                            
                            Image(systemName: "arrow.right")
                        }
                        .foregroundColor(.white)
                        .font(.system(.title2, design: .rounded))
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)

                        
                    }
                    .padding()
                    .background(Color.mainColor)
                    .cornerRadius(8)

                    
                    HStack {
                        Text(Constants.alreadyUser)
                            .foregroundColor(.secondary)
                        NavigationLink {
                            LoginPageView()
                        } label: {
                            Text("Login")
                                .foregroundColor(.mainColor)
                        }

                    }
                }
                .padding()
            }
        }
        .fullScreenCover(isPresented: $showSignUpScreen) {
            SignUpPageView()
                .transition(.move(edge: .trailing))
        }
    }
}

struct WelcomePageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView()
    }
}
