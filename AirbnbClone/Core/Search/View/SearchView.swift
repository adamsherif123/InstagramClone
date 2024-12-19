//
//  SearchView.swift
//  AirbnbClone
//
//  Created by Adam Sherif on 6/21/24.
//

import SwiftUI

struct SearchView: View {
    @State private var search = ""
    @StateObject var viewModel = SearchViewModel()
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12 ) {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            HStack {
                                CircularProfileImageView(user: user, widthAndHeight: 40, personDimensions: 20)
                                
                                VStack(alignment: .leading) {
                                    if let fullname = user.fullname {
                                        Text(fullname)
                                            .fontWeight(.semibold)
                                    }
                                    
                                    Text(user.username)
                                }
                                .font(.footnote)
                                
                                Spacer()
                            }
                            .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal)
                }
                .searchable(text: $search, prompt: "Search...")
                .padding(.top)
                
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: User.self) { user in
                ProfileView(user: user)
            }
            
        }
    }
}

#Preview {
    SearchView()
}
