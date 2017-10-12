//
//  LoginRepository.swift
//  MVVM_Demo
//
//  Created by Mai Hoang Anh on 10/5/17.
//  Copyright © 2017 eastgate. All rights reserved.
//

import Foundation

class LoginRepository: LoginRepositoryProtocol {
    
    func loginWithNormalUser(email: String, password: String) -> Bool {
        if email == "admin@gmail.com" && password == "123456" {
            return true
        }
        return false
    }
    
}
