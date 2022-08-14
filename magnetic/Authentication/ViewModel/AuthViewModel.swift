//
//  AuthViewModel.swift
//  magnetic
//
//  Created by HDSB on 2022-08-13.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        //if user is logged in, store user's session
        self.userSession = Auth.auth().currentUser
        print("DEBUG: user current seession is \(self.userSession)")

        
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG FAILED TO SIGN IN WITH ERROR \(error.localizedDescription)")
                return
            }
            
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG FAILED TO REGISTER WITH ERROR \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            print("DEBUG: sucessfully registered user")
            
            let data = ["email": email, "password": password, "full name": fullname, "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    print("DEBUG did upload user data")
                }
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
}
