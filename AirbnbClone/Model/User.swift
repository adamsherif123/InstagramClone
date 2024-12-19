//
//  User.swift
//  AirbnbClone
//
//  Created by Adam Sherif on 12/12/24.
//

import Foundation
import Firebase

struct User: Identifiable, Codable, Hashable  {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    let email: String
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "adam", profileImageUrl: nil, fullname: "Adam Sherif", bio: "Columbia 26", email: "adamsherif167@gmail.com"),
        .init(id: NSUUID().uuidString, username: "balint", profileImageUrl: nil, fullname: "Balint Kidd", bio: "Slim Shady", email: "balint@gmail.com"),
        .init(id: NSUUID().uuidString, username: "emile", profileImageUrl: nil, fullname: "Emile Al-Billeh", bio: "SEAS 26", email: "emile@hotmail.com"),
        .init(id: NSUUID().uuidString, username: "jad", profileImageUrl: nil, fullname: "Karim ElTorkey", bio: "Squash", email: "Torkey@gmail.com"),
        .init(id: NSUUID().uuidString, username: "aelwabory", profileImageUrl: nil, fullname: "Ahmed Elwabory", bio: "I love women", email: "aelwabory5@gmail.com")
        
    ]
}
