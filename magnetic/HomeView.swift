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
                show.toggle()
            } label: {
                Image("+ button")
            }

            .fullScreenCover(isPresented: $show) {
                newPostContentView()
            }
        }
        
        
    }
}

