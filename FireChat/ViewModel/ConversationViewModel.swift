//
//  ConversationViewModel.swift
//  FireChat
//
//  Created by Oscar Rodriguez Garrucho on 26/11/20.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import Foundation

struct ConversationViewModel {

    private let conversation: Conversation

    init(conversation: Conversation) {
        self.conversation = conversation
    }

    var profileImageUrl: URL? {
        return URL(string: conversation.user.profileImageUrl)
    }

    var timestamp: String {
        let date = conversation.message.timesstamp.dateValue()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: date)
    }

    var username: String {
        return conversation.user.username
    }

    var lastMessage: String {
        return conversation.message.text
    }
}
