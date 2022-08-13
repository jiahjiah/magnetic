//
//  PostModel.swift
//  magnetic
//
//  Created by HDSB on 2022-08-13.
//

import Foundation

struct Post: Identifiable {
    let id: Int
    let creator: String
    let videoId: String
    let amount: Double
    let likes: Int
    let date: String
        
    var dateParsed: Date {
        date.dateParsed()
    }
}
