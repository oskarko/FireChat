//
//  MessageViewModel.swift
//  FireChat
//
//  Created by Oscar Rodriguez Garrucho on 26/11/20.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import UIKit

struct MessageViewModel {

    private let message: Message

    var messageBackgroundColor: UIColor {
        return message.isFromCurrentUser ? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) : .systemPurple
    }

    var messageTextColor: UIColor {
        return message.isFromCurrentUser ? .black : .white
    }

    init(message: Message) {
        self.message = message
    }
}
