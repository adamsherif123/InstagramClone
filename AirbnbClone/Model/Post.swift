//
//  Post.swift
//  AirbnbClone
//
//  Created by Adam Sherif on 6/21/24.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    
    //This is all the data that a post needs to have in total
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageURL: String
    let timeStamp: Date
    var user: User?
}


//The extention is creating new posts that are mannualy given that are used to model the data. 
extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "This is some test caption for now",
            likes: 800,
            imageURL: "Wolf",
            timeStamp: Date(),
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Hello World",
            likes: 756,
            imageURL: "Car",
            timeStamp: Date(),
            user: User.MOCK_USERS[3]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "I love this dragon",
            likes: 1540,
            imageURL: "Dragon",
            timeStamp: Date(),
            user: User.MOCK_USERS[2]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "I want to buy this shoe",
            likes: 7563,
            imageURL: "SHoes",
            timeStamp: Date(),
            user: User.MOCK_USERS[1]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "I love spiderman",
            likes: 76,
            imageURL: "Cheetah",
            timeStamp: Date(),
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            caption: "Belly Dancer",
            likes: 1274893,
            imageURL: "Ali",
            timeStamp: Date(),
            user: User.MOCK_USERS[4]
        ),
        
    ]
}
