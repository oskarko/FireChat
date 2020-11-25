//
//  RegistrationViewModel.swift
//  FireChat
//
//  Created by Oscar Rodriguez Garrucho on 25/11/20.
//  Copyright © 2020 Little Monster. All rights reserved.
//

import Foundation

struct RegistrationViewModel: AuthenticationProtocol {
    var email: String?
    var fullName: String?
    var username: String?
    var password: String?

    var formIsValid: Bool {
        return (email ?? "") != "" && (fullName ?? "") != ""
            && (username ?? "") != "" && (password ?? "") != ""
    }
}
