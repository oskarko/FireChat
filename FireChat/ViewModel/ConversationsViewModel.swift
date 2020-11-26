//
//  ConversationsViewModel.swift
//  FireChat
//
//  Created by Oscar Rodriguez Garrucho on 26/11/20.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import Firebase

struct ConversationsViewModel {

    func fetchConversations(completion: @escaping([Conversation]) -> Void) {
        Service.shared.fetchConversations(completion: completion)
    }
}
