//
//  newPostView.swift
//  magnetic
//
//  Created by HDSB on 2022-08-13.
//

import SwiftUI

struct newPostView: View {
    @State var translation: CGSize = .zero
    @State var offsetY: CGFloat = 0
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            content
            //x button
            Button {
                withAnimation(.easeOut) {
                    show.toggle()
                }
               
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
            .opacity(show ? 1 : 0)
            
            


        }
        

    }
    
    var content: some View {
        GeometryReader { proxy in
            ZStack {
            VStack {
              newPostContentView()
            }
            //background
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            .mask(
                RoundedRectangle(cornerRadius: 40, style: .continuous)
                   // .stroke(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4000000059604645)), lineWidth: 5)
                    .blendMode(.overlay)
                    .overlay(
                       RoundedRectangle(cornerRadius: 40, style: .continuous)
                            .stroke(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.4000000059604645)), lineWidth: 5)
                            .blur(radius: 10)
                    )
            )
            //.background(VisualEffectBlurView(blurStyle: .systemThinMaterialLight).intensity(0.99))
               // .mask(RoundedRectangle(cornerRadius: 40, style: .continuous))
            //drag indicator
            .overlay{
                RoundedRectangle(cornerRadius: 10)
                    .fill(.black.opacity(0.3))
                    .frame(width: 48, height: 5)
                    .frame(height: 20)
                    .frame(maxHeight: .infinity, alignment: .top)
            }
            .offset(y: translation.height + offsetY)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        translation = value.translation
                    }
                    .onEnded() { value in
                        withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6)) {
                            let snap = translation.height + offsetY
                            let half = proxy.size.height / 2
                            
                            
                            if snap > half*2 {
                                offsetY = 0
                            } else {
                                show.toggle()
                            }
                            
                            translation = .zero
                        }
                    }
            )
        .ignoresSafeArea(edges: .bottom)

        }
        }
    }
}

struct newPostView_Previews: PreviewProvider {
    static var previews: some View {
        newPostView(show: .constant(true))
            .background(.blue)
    }
}
