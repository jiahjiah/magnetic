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
                    AllPostsView()
                        .tabItem {
                            Image(systemName: "house")
                                .padding()
                        }
                    LeaderboardView()
                        .tabItem {
                            Image(systemName: "medal.fill")
                                .padding()
                        }

                    }

            }
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static let postListVM: PostListViewModel = {
        let postListVM = PostListViewModel()
        postListVM.posts = postListPreviewData
        return postListVM
    }()
    
    static var previews: some View {
        ContentView()
            .environmentObject(postListVM)
    }
}
