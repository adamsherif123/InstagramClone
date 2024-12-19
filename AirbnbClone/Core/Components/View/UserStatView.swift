//
//  UserStatView.swift
//  AirbnbClone
//
//  Created by Adam Sherif on 6/21/24.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    
    var body: some View {
        
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text(title)
                .font(.footnote)
                .fontWeight(.semibold)

        }
        .frame(width: 72)
    }
}

#Preview {
    UserStatView(value: 290, title: "posts")
}
