//
//  PostViewModel.swift
//  magnetic
//
//  Created by HDSB on 2022-08-13.
//

import Foundation

final class PostListViewModel: ObservableObject {
    //published = sends notifications to subscribers whenever value has changed
    @Published var posts: [Post] = []
    
}

