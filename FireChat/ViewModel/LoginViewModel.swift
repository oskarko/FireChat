//
//  LoginViewModel.swift
//  FireChat
//
//  Created by Oscar Rodriguez Garrucho on 25/11/20.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import Foundation

struct LoginViewModel {
    var email: String?
    var password: String?

    var formIsValid: Bool {
        return (email ?? "") != "" && (password ?? "") != ""
    }
}
