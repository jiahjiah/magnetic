//
//  UserModel.swift
//  magnetic
//
//  Created by HDSB on 2022-08-14.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let email: String
    let fullname: String
}
