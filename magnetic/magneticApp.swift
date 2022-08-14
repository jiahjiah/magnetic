//
//  magneticApp.swift
//  magnetic
//
//  Created by HDSB on 2022-08-13.
//

import SwiftUI
import Firebase


@main
struct magneticApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
      //      ContentView()
            LoginView()
        }
    }
}
