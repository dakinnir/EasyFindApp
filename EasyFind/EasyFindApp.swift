//
//  EasyFindApp.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 9/18/22.
//

import SwiftUI
import FirebaseCore

@main
struct EasyFindApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    @StateObject var authViewModel = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
        }
    }
}
