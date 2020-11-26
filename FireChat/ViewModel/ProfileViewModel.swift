//
//  ProfileViewModel.swift
//  FireChat
//
//  Created by Oscar Rodriguez Garrucho on 26/11/20.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import Firebase

struct ProfileViewModel {

    func fetchUser(completion: @escaping(User) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        Service.shared.fetchUser(withUid: uid, completion: completion)
    }
}
