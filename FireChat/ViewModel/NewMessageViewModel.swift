//
//  NewMessageViewModel.swift
//  FireChat
//
//  Created by Oscar Rodriguez Garrucho on 26/11/20.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import Firebase

struct NewMessageViewModel {

    func fetchUsers(completion: @escaping([User]) -> Void) {
        Service.shared.fetchUsers(completion: completion)
    }
}
