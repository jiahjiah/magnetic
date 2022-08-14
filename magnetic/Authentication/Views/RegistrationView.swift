//
//  RegistrationView.swift
//  magnetic
//
//  Created by HDSB on 2022-08-13.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        //header
        VStack {
            VStack(alignment: .leading) {
                HStack { Spacer() }
                Text("Get Started.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Create your account")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .frame(height: 260)
            .padding(.leading)
            .background(.teal)
            .foregroundColor(.white)
            .clipShape(RoundedShape(corners: [.bottomRight]))
            
            //fields
            VStack(spacing: 40) {
                TextField("Email", text: $email)
                TextField("Full Name", text: $fullname)
                SecureField("Password", text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            //button
            Button {
                viewModel.register(withEmail: email, password: password, fullname: fullname)
            } label: {
                Image("Sign Up")
            }
            .padding(32)

            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
                //LoginView()
            } label: {
                HStack {
                    Text("Already have an account?")
                        .font(.footnote)
                    
                    Text("Sign In")
                        .font(.body)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color.teal)
            
        }
        .ignoresSafeArea()
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
