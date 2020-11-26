//
//  LoginViewModel.swift
//  FireChat
//
//  Created by Oscar Rodriguez Garrucho on 25/11/20.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import Firebase

protocol AuthenticationProtocol {
    var formIsValid: Bool { get }
}

struct LoginViewModel: AuthenticationProtocol {
    var email: String?
    var password: String?

    var formIsValid: Bool {
        return (email ?? "") != "" && (password ?? "") != ""
    }

    func logUserIn(withEmail email: String, password: String, completion: AuthDataResultCallback?) {

        AuthService.shared.logUserIn(withEmail: email,
                                     password: password,
                                     completion: completion)
    }
}
