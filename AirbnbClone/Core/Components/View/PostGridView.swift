//
//  PostGridView.swift
//  AirbnbClone
//
//  Created by Adam Sherif on 6/21/24.
//

import SwiftUI
import Kingfisher

struct PostGridView: View {
    
    private let gridItems: [GridItem] = [
         .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    @StateObject var viewModel: PostGridViewModel
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            LazyVGrid(columns: gridItems, spacing: 1) {
                ForEach(viewModel.posts) { post in
                    KFImage(URL(string: post.imageURL))
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageDimension, height: imageDimension)
                        .clipped()
                }
            }
        }
    }
}

#Preview {
    PostGridView(user: User.MOCK_USERS[3])
}
