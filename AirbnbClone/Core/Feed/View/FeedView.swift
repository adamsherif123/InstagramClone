//
//  FeedView.swift
//  AirbnbClone
//
//  Created by Adam Sherif on 6/21/24.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.posts) { post in
                        FeedCellView(post: post)
                    }
                }
                .padding(.top, 8)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("instagram_logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 32)
                        
                    
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "paperplane")
                            .foregroundColor(.black)
                            .imageScale(.large)
                    }
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
