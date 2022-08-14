//
//  SingularPost.swift
//  magnetic
//
//  Created by HDSB on 2022-08-13.
//

//what each singular post looks like
import SwiftUI

struct SingularPost: View {
    var post: Post
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {

            if let user = post.user {
                HStack(spacing: 20) {
                    
                
                    VStack(alignment: .leading, spacing: 6) {
                        //MARK: Creator Name
                        Text(user.fullname)
                            .font(.headline)
                            .bold()
                            .lineLimit(1)
                        
                        //MARK: Price
                        Text(post.amount, format: .currency(code: "CAD"))
                            .font(.footnote)
                            .opacity(0.7)
                            .lineLimit(1)
                    }
                    
                    Spacer()
                    
                    //MARK: Post Date
                    Text("1d")
                  //  Text(post.timestamp, format: .dateTime.year().month().day())
                    //    .font(.footnote)
                 //       .foregroundColor(.secondary)

                } //end of header
                .padding([.top, .bottom], 8)
                
                //embded video
                VideoView(videoId: post.videoId)
                    .frame(height: 300)
                    .cornerRadius(12)
                
                //likes
                HStack {
                    Text(String(post.likes))
                        .bold()
                        .foregroundColor(.darkPurple)
                    Image(systemName: "heart")
                        .foregroundColor(.darkPurple)
                }
            

            }
 
        }
    }
}

