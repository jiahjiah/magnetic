//
//  ContentView.swift
//  magnetic
//
//  Created by HDSB on 2022-08-13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
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

struct ContentView_Previews: PreviewProvider {
    static let postListVM: PostListViewModel = {
        let postListVM = PostListViewModel()
        postListVM.posts = subscriptionListPreviewData
        return postListVM
    }()
    
    static var previews: some View {
        ContentView()
            .environmentObject(postListVM)
    }
}
