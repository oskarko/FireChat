//
//  Service.swift
//  FireChat
//
//  Created by Oscar Rodriguez Garrucho on 25/11/20.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import Foundation
import Firebase

struct Service {
    static let shared = Service()

    func fetchUsers(completion: @escaping([User]) -> Void) {
        var users = [User]()
        Firestore.firestore().collection("users").getDocuments { (snapshot, error) in
            // Each document is an user!
            snapshot?.documents.forEach({ document in
                let dictionary = document.data()
                let user = User(dictionary: dictionary)
                users.append(user)
            })
            completion(users)
        }
    }

    func uploadMessage(_ message: String, to user: User, completion: @escaping(Error?) -> Void) {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }

        let data = ["text": message,
                    "fromId": currentUid,
                    "toId": user.uid,
                    "timestamp": Timestamp(date: Date())] as [String: Any]

        COLLECTION_MESSAGES.document(currentUid).collection(user.uid)
            .addDocument(data: data) { _ in
                COLLECTION_MESSAGES.document(user.uid).collection(currentUid)
                    .addDocument(data: data, completion: completion)
            }
    }
    
}
