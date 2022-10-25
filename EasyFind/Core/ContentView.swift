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
                LoginPageView()
            }
        }
    }
    
    let appearance: UITabBarAppearance = UITabBarAppearance()
    
    init() {
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    private var homeTabView: some View {
        TabView {
            NavigationView {
                ExploreView()
                    .navigationTitle("Explore")
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Explore")
            }
            .tag(1)
            
            // MARK: - Messages
            NavigationView {
                MessagesView()
                    .navigationTitle("Messages")
            }
            .tabItem {
                Image(systemName: "bubble.left.and.bubble.right.fill")
                Text("Messages")
            }
            .tag(2)
            
            // MARK: - Calendar
            NavigationView {
                CalendarView()
                    .navigationTitle("Calendar")
            }
            .tabItem {
                Image(systemName: "calendar.circle.fill")
                Text("Calendar")
            }
            .tag(3)
            
            // MARK: - Notifications
            NavigationView {
                Text("Notifications Tab")
                    .navigationTitle("Notifications")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Image(systemName: "bell.fill")
                Text("Notifications")
            }
            .tag(4)
            
            // MARK: - Profile
            NavigationView {
                ProfileTabView()
                    .navigationTitle("Profile")
            }
            .tabItem {
                Image(systemName: "person.circle.fill")
                Text("Profile")
            }
            .tag(5)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthenticationViewModel())
    }
}




