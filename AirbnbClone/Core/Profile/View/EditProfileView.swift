//
//  EditProfileView.swift
//  AirbnbClone
//
//  Created by Adam Sherif on 12/14/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: EditProfileViewModel
    
    //This step was made cause the viewModel requires passing in a user
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: EditProfileViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                    
                    Spacer()
                    
                    
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    
                    
                    Spacer()
                    
                    Button {
                        Task { try await viewModel.updateUserData() }
                        dismiss()
                    } label: {
                        Text("Done")
                            .bold()
                    }
                }
                .padding(.horizontal)
                
                Divider()
            }
            
            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                    if let image = viewModel.profileImage {
                        image
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.white)
                            .background(.gray)
                            .clipShape(Circle())
                    } else {
                        CircularProfileImageView(user: viewModel.user, widthAndHeight: 80, personDimensions: 30)
                    }
                    
                    Text("Edit profile picture")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    
                    Divider()
                }
            }
            .padding(.vertical, 8)
            
            VStack {
                EditProfileRowView(title: "Name", placeholder: "Enter your name...", text: $viewModel.fullname)
                
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio...", text: $viewModel.bio)
            }
            
            Spacer()
        }
    }
}

struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            
            VStack {
                TextField(placeholder, text: $text)
                
                Divider()
            }
            .font(.subheadline)
            .frame(height: 36)
        }
        
    }
}

