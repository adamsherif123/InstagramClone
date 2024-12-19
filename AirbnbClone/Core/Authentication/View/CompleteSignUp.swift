//
//  CompleteSignUp.swift
//  AirbnbClone
//
//  Created by Adam Sherif on 6/21/24.
//

import SwiftUI

struct CompleteSignUp: View {
    
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    @State private var username = ""
    
    var body: some View {
        
        VStack(spacing: 12) {
            
            Spacer()
            
            Text("Welcome to Instagram, \(viewModel.username) ")
                .padding(.horizontal)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
                .multilineTextAlignment(.center)

            
            Text("Click below to complete sign up and start using instagram")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            
            Button {
                Task { try await viewModel.createUser() }
            } label: {
                Text("Complete Sign Up")
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
    CompleteSignUp()
}
