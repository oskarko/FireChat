//
//  Message.swift
//  FireChat
//
//  Created by Oscar Rodriguez Garrucho on 26/11/20.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import Firebase

struct Message {
    let text: String
    let toId: String
    let fromId: String
    let timesstamp: Timestamp!
    var user: User?

    let isFromCurrentUser: Bool

    init(dictionary: [String: Any]) {
        text = dictionary["text"] as? String ?? ""
        toId = dictionary["toId"] as? String ?? ""
        fromId = dictionary["fromId"] as? String ?? ""
        timesstamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())

        isFromCurrentUser = fromId == Auth.auth().currentUser?.uid


    }
}

struct Conversation {
    let user: User
    let message: Message
}
