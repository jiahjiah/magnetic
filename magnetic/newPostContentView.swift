//
//  newPostContentView.swift
//  magnetic
//
//  Created by HDSB on 2022-08-13.
//

import SwiftUI

class FormViewModel: ObservableObject{
    @State var creator = ""
    @State var videoId = ""
    @State var description = ""

    @State var renewalDate = Date()
}


struct newPostContentView: View {
    @StateObject var postListVM = PostListViewModel()

    
    @StateObject var viewModel = FormViewModel()
    

    
    var body: some View {

        VStack {
            Text("New Post")
                .font(.largeTitle)
                .bold()
                .padding(30)
                Spacer()
                .cornerRadius(30)
                .foregroundColor(.white)
            Form {
                Section {
                    TextField("Creator", text: $viewModel.creator)
                }
                Section(header: Text("EX: if your link is https://www.youtube.com/watch?v=CX-BdDHW0Ho, Your id is CX-BdDHW0Ho")) {
                    TextField("YouTube Video Id", text: $viewModel.videoId)
                }
                Section {
                    TextField("Description", text: $viewModel.description)
                        .frame(height: 200, alignment: .topTrailing)
                }

                
                    
            }
            .onAppear {
                UITableView.appearance().backgroundColor = .clear
            }

        }
        .background(Color.lightTeal)

    }
}


struct newPostContentView_Previews: PreviewProvider {
    static var previews: some View {
        newPostContentView()
    }
}
