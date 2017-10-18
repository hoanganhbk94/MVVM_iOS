//
//  LoginService.swift
//  MVVM_Demo
//
//  Created by Mai Hoang Anh on 10/5/17.
//  Copyright © 2017 eastgate. All rights reserved.
//

import Foundation

class LoginService: LoginServiceProtocol {
    private var _userRepository: UserRepositoryProtocol!
    
    init(userRepository: UserRepositoryProtocol) {
        _userRepository = userRepository
    }
    
    func loginWithNormalUser(email: String, password: String) -> Bool {
        return _userRepository!.loginWithNormalUser(email: email, password: password)
    }
}
