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
    }
    
    func login(withEmail email: String, password: String) {
        print("with email \(email)")
    }
    
    func register(withEmail email: String, password: String, fullname: String) {
        print("with email \(email)")
    }
}
