//
//  ContentView.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 9/18/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        Group {
            if authViewModel.currentUserSession != nil {
                homeTabView
            } else {
                WelcomePageView()
            }
        }
    }
    
    private var homeTabView: some View {
        TabView {
            ExplorePageView()
                .tabItem {
                Image(systemName: "magnifyingglass.circle.fill")
                Text("Explore")
            }
            Text("Messages Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded)) .tabItem {
                    Image(systemName: "envelope")
                    Text("Messages")
                }
            
            Text("Calendar Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded)) .tabItem {
                    Image(systemName: "calendar.circle.fill")
                    Text("Calendar")
                }
            
            Text("Notifications Tab")
                .font(.system(size: 30, weight: .bold, design: .rounded)) .tabItem {
                    Image(systemName: "bell.fill")
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
            .environmentObject(AuthenticationViewModel())
    }
}




