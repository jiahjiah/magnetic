//
//  HomeView.swift
//  magnetic
//
//  Created by HDSB on 2022-08-13.
//

import SwiftUI

struct HomeView: View {
    @State var show = false
    
    var body: some View {
        
        ZStack(alignment: .bottom){
            AllPostsView()
            
            Button {
                withAnimation {
                    show.toggle()
                }
            } label: {
                Image("+ button")
            }

            
            if show {
                newPostView(show: $show)
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static let postListVM: PostListViewModel = {
        let postListVM = PostListViewModel()
        postListVM.posts = postListPreviewData
        return postListVM
    }()
    
    static var previews: some View {
        HomeView()
            .environmentObject(postListVM)
    }
}
