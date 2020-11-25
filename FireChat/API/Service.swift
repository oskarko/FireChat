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

    func fetchUsers() {
        Firestore.firestore().collection("users").getDocuments { (snapshot, error) in
            // Each document is an user!
            snapshot?.documents.forEach({ document in
                
            })
        }
    }
}
