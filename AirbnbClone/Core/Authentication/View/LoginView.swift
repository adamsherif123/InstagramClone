//
//  LoginView.swift
//  AirbnbClone
//
//  Created by Adam Sherif on 6/21/24.
//

import SwiftUI

struct LoginView: View {

    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                Image("instagram_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                VStack {
                    TextField("Enter your email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .modifier(TextFieldModifier())
                    
                    SecureField("Password", text: $viewModel.password)
                    .modifier(TextFieldModifier())
                }
                
                Button {
                    print("Forgot Password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 24)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button {
                    Task { try await viewModel.signIn() }
                } label: {
                    Text("Log In")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(.blue)
                        .cornerRadius(8)
                        .padding(.vertical)
                }
                
                HStack {
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                    
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 40, height: 0.5)
                }
                .foregroundColor(.gray)
                
                HStack {
                    Image("facebook_logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .clipShape(Circle())
                    
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                }
                .padding(.top, 8 )
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    AddEmailView()  
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack {
                        Text("Don't have an account? ") +
                         
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .padding(.vertical, 16)
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
