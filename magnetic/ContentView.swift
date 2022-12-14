//
//  ContentView.swift
//  magnetic
//
//  Created by HDSB on 2022-08-13.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    
    var body: some View {
        Group {
            //if no user logged in
            if viewModel.userSession == nil {
                LoginView()
            } else {
                //have a logged in user
                TabView {
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                                .padding()
                        }
                    LeaderboardView()
                        .tabItem {
                            Image(systemName: "star")
                                .padding()
                        }

                    }

            }
            
        }
        
        
    }
}

