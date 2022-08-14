//
//  newPostContentView.swift
//  magnetic
//
//  Created by HDSB on 2022-08-13.
//

import SwiftUI



struct newPostContentView: View {
    @StateObject var postListVM = PostListViewModel()
    @ObservedObject var viewModel = UploadPostViewModel()
    @Environment(\.presentationMode)var presentationMode
    
    @State var videoId = ""
    @State var description = ""
    @State var amount = ""



    
    var body: some View {

        VStack {
            //x button
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.body.bold())
                    .foregroundColor(.white)
                    .padding(9)
                    .background(Color.black)
                    .mask(Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding()

            Text("New Post")
                .font(.largeTitle)
                .bold()
                .padding(30)
                Spacer()
                .cornerRadius(30)
                .foregroundColor(.white)
            
                Section(header: Text("EX: if your link is https://www.youtube.com/watch?v=CX-BdDHW0Ho, Your id would be CX-BdDHW0Ho")) {
                    TextField("YouTube Video Id", text: $videoId)
                        .padding()
                        .background(.white)

                }
                Section {
                    TextField("Description", text: $description)
                        .frame(height: 200, alignment: .topTrailing)
                        .padding()
                        .background(.white)

                }
                Section {
                    TextField("Amount", text: $amount)
                        .padding()
                        .background(.white)

                }

            

            //confirm button
            Button {
                viewModel.uploadPost(withVideoId: videoId, withDescription: description, withAmount: amount)
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "checkmark")
                    .font(.body.bold())
                    .foregroundColor(.white)
                    .padding(9)
                    .background(Color.black)
                    .mask(Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding()
            

        }
        .padding(32)
        .background(Color.lightTeal)

    }
}


struct newPostContentView_Previews: PreviewProvider {
    static var previews: some View {
        newPostContentView()
    }
}
