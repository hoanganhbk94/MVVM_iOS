//
//  LoginService.swift
//  MVVM_Demo
//
//  Created by Mai Hoang Anh on 10/5/17.
//  Copyright © 2017 eastgate. All rights reserved.
//

import Foundation

class LoginService: LoginServiceProtocol {
    
    private var _loginRepository: LoginRepositoryProtocol!
    
    init(loginRepository: LoginRepositoryProtocol) {
        _loginRepository = loginRepository
    }
    
    func loginWithNormalUser(email: String, password: String) -> Bool {
        return _loginRepository!.loginWithNormalUser(email: email, password: password)
    }
    
}
