//
//  PostService.swift
//  magnetic
//
//  Created by HDSB on 2022-08-14.
//

import Foundation
import Firebase

struct PostService {
    
    func uploadPost(videoId: String, description: String, amount: String) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let data = ["uid": uid, "videoId": videoId, "description": description, "amount": amount, "likes": "0", "timestamp": Timestamp(date: Date())] as [String : Any]
        
        Firestore.firestore().collection("posts").document()
            .setData(data) { _ in
                print("Tweet uploaded")
            }
    }
    
    func fetchPosts(completion: @escaping([Post]) -> Void) {
        Firestore.firestore().collection("posts").getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            
            let posts = documents.compactMap({ try? $0.data(as: Post.self)})
            completion(posts)
        }

    }
}
