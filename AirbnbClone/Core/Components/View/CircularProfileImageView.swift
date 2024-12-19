//
//  CircularProfileImageView.swift
//  AirbnbClone
//
//  Created by Adam Sherif on 12/16/24.
//
import SwiftUI
import Kingfisher

struct CircularProfileImageView: View {
    
    let user: User
    let widthAndHeight: CGFloat
    let personDimensions: CGFloat
    
    var body: some View {
        if let profileImageUrl = user.profileImageUrl {
            KFImage(URL(string: profileImageUrl))
                .resizable()
                .frame(width: widthAndHeight, height: widthAndHeight)
                .clipShape(Circle())
        } else {
            ZStack {
                Circle()
                    .foregroundColor(Color(.systemGray2))
                    .frame(width: widthAndHeight, height: widthAndHeight)
                
                Image(systemName: "person")
                    .resizable()
                    .frame(width: personDimensions, height: personDimensions)
                    .foregroundColor(.white)
            }
        }
    }
}
