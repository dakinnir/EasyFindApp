//
//  AuthenticationViewModel.swift
//  EasyFind
//
//  Created by Daniel Akinniranye on 10/4/22.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthenticationViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var currentUserSession: User?
    
    let firestoreRef = Firestore.firestore()  // Reference to Firestore

    init() {
        self.currentUserSession = Auth.auth().currentUser
    }
    
    // MARK: - Forgot Password

    public func forgotPassword(withEmail email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
     
    // MARK: - Login User
    public func loginUser(withEmail email: String, withPassword password: String, completion: @escaping (String?) -> Void)  {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let err = error {
                print("DEBUG: Failed to register user \(err.localizedDescription)")
                completion(err.localizedDescription)
                return
            }
            
            completion(nil)
            guard let userLoggedIn = result?.user else { return }
            self.currentUserSession = userLoggedIn
        }
    }
    
    // MARK: - Register User
    public func registerUser(withName fullName: String, withEmail email: String, withPassword password: String, completion: @escaping (String?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let err = error {
                print("DEBUG: Failed to register user \(err.localizedDescription)")
                completion(err.localizedDescription)
                return
            }
            
            guard let user = result?.user else { return }
            
            self.currentUserSession = user
            completion(nil)
            print("DEBUG: User is successfully registered \(user)")
            self.firestoreRef.collection("/users").addDocument(data: [
                "name": fullName,
                "email": email,
                "userId": user.uid,
            ])
        }
    }
    
    func logoutUser() {
        // Setting the current user to nil
        self.currentUserSession = nil
        print(currentUserSession ?? "Empty")
        try? Auth.auth().signOut() // Signing the user out on the firebase server
    }
}
