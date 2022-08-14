//
//  AllPostsView.swift
//  magnetic
//
//  Created by HDSB on 2022-08-13.
//

import SwiftUI

struct AllPostsView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @EnvironmentObject var postListVM: PostListViewModel
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack {
                    Image("header")
                        .ignoresSafeArea()
                    
                    HStack {
                        //MARK: Header Title
                        
                        Text("Your Feed")
                            .bold()
                            .font(.title)
                            .foregroundColor(.darkPurple)
                            .padding(.leading, 20)
                        
                        Spacer()
                        
                    
                }
                    //MARK: All Posts List

                    ForEach(postListVM.posts) { post in
                        SingularPost(post: post)
                            .padding()
                            .frame(width: UIScreen.main.bounds.width / 1.1)
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                            .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)

                        Divider()
                    }
                    
                    //MARK: Log Out Button
                    Button {
                        viewModel.signOut()
                    } label: {
                        Image("Log Out")
                    }

                }
                
                
            }
            
        }
        
    }
}

struct AllPostsView_Previews: PreviewProvider {
    static let postListVM: PostListViewModel = {
        let postListVM = PostListViewModel()
        postListVM.posts = postListPreviewData
        return postListVM
    }()
    
    static var previews: some View {
        AllPostsView()
            .environmentObject(postListVM)
    }
}

