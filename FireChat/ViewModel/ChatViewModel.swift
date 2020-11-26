//
//  ChatViewModel.swift
//  FireChat
//
//  Created by Oscar Rodriguez Garrucho on 26/11/20.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import Firebase

struct ChatViewModel {

    func uploadMessage(_ message: String, to user: User, completion: @escaping(Error?) -> Void) {
        Service.shared.uploadMessage(message, to: user, completion: completion)
    }

    func fetchMessages(forUser user: User, completion: @escaping([Message]) -> Void) {
        Service.shared.fetchMessages(forUser: user, completion: completion)
    }
}
