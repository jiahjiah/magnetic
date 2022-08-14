//
//  LoginView.swift
//  magnetic
//
//  Created by HDSB on 2022-08-13.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        //parent container
        VStack {
            //header view
            VStack(alignment: .leading) {
                HStack { Spacer() }
                Text("Hello. 👋")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text("Welcome Back!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .frame(height: 260)
            .padding(.leading)
            .background(.teal)
            .foregroundColor(.white)
            .clipShape(RoundedShape(corners: [.bottomRight]))
            
            //text fields
            VStack(spacing: 40) {
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            //forgot password
            HStack {
                Spacer()
                
                NavigationLink {
                    Text("Reset Password")
                } label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.lightPurple)
                        .padding(.top)
                        .padding(.trailing, 24)
                }
            }
            
            Button {
                viewModel.login(withEmail: email, password: password)
            } label: {
                Image("Sign In")
            }
            
            Spacer()
            
            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("Don't have an account?")
                        .font(.footnote)
                    
                    Text("Sign Up")
                        .font(.body)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color.teal)

        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
