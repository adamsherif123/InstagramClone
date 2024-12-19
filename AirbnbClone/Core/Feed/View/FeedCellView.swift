//
//  FeedCellView.swift
//  AirbnbClone
//
//  Created by Adam Sherif on 6/21/24.
//

import SwiftUI
import Kingfisher

struct FeedCellView: View {
    
    let post: Post
    
    var body: some View {
        VStack {
            HStack {
                if let user = post.user {
                    CircularProfileImageView(user: user, widthAndHeight: 40, personDimensions: 20)
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                
                Spacer()
            }
            .padding(.leading, 8)
            
            
            KFImage(URL(string: post.imageURL))
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            HStack(spacing: 16) {
                Button {
                    print("Like post")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                
                Button {
                    print("comment post")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                
                Button {
                    print("Share post")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundColor(.black)
            
            
            
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            HStack {
                if let user = post.user {
                    Text("\(user.username) ").fontWeight(.semibold) +
                    Text(post.caption)
                }
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    FeedCellView(post: Post.MOCK_POSTS[0])
}
