//
//  UploadPostViewModel.swift
//  magnetic
//
//  Created by HDSB on 2022-08-14.
//

import Foundation

class UploadPostViewModel: ObservableObject {
    let service = PostService()
    
    func uploadPost(withVideoId videoId: String, withDescription description: String, withAmount amount: String) {
        service.uploadPost(videoId: videoId, description: description, amount: amount)
        
    }
}
