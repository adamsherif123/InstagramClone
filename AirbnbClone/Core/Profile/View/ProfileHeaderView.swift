//
//  ProfileHeaderView.swift
//  AirbnbClone
//
//  Created by Adam Sherif on 6/21/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    let user: User
    @State private var showEditProfile = false
    
    var body: some View {
        
        VStack {
            HStack { 
                CircularProfileImageView(user: user, widthAndHeight: 80, personDimensions: 30)
                
                Spacer()
                
                HStack(spacing: 8) {
                    UserStatView(value: 289, title: "Posts")
                    UserStatView(value: 6000, title: "Followers")
                    UserStatView(value: 185, title: "Following")
                }
            }
            .padding(.horizontal)
            
            VStack(alignment: .leading) {
                if let fullname = user.fullname {
                    Text(fullname)
                        .fontWeight(.semibold)
                }
                
                Text(user.username)
                    .fontWeight(.semibold)
                
                if let bio = user.bio {
                    Text(bio)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .font(.footnote)
            
            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                } else {
                    print("Follow user...")
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : .blue)
                    .foregroundColor(user.isCurrentUser ? .black : .white )
                    .cornerRadius(6 )
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1))
            }
            
            Divider()
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }

    }
}

#Preview {
    ProfileHeaderView(user: User.MOCK_USERS[2])
}
