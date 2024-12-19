//
//  AddEmailView.swift
//  AirbnbClone
//
//  Created by Adam Sherif on 6/21/24.
//

import SwiftUI

struct AddEmailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    var body: some View {
        
        VStack(spacing: 12) {
            
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("You'll use this email to sign into your account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            TextField("Email", text: $viewModel.email)
                .autocapitalization(.none)
                .modifier(TextFieldModifier())
                .padding(.top) 
            
            NavigationLink {
                CreateUsernameView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Next ")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(.blue)
                    .cornerRadius(8)
                    .padding(.vertical)
            }
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

#Preview {
    AddEmailView()
}
