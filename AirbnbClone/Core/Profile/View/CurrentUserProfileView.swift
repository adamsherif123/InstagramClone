//
//  SwiftUIView.swift
//  AirbnbClone
//
//  Created by Adam Sherif on 6/21/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileHeaderView(user: user)
                PostGridView(user: user)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}


