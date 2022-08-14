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
    
    @StateObject var viewModel = AuthViewModel()

    @StateObject var postListVM: PostListViewModel = {
        let postListVM = PostListViewModel()
        postListVM.posts = postListPreviewData
        return postListVM
    }()
    
 
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(viewModel)
            .environmentObject(postListVM)

        }

    }
}
