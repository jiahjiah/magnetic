//
//  PostViewModel.swift
//  magnetic
//
//  Created by HDSB on 2022-08-13.
//

//view model so we can see preview data
import Foundation

class PostListViewModel: ObservableObject {
    @Published var posts = [Post]()
    let service = PostService()
    let userService = UserService()
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        service.fetchPosts { posts in
            self.posts = posts
            
            for i in 0 ..< posts.count {
                let uid = posts[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                   // self.posts[i].user = user
                }

            }
            
        }
    }
    
}

