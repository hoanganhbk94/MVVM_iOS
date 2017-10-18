//
//  UserRepository.swift
//  MVVM_Demo
//
//  Created by Anh Mai on 10/18/17.
//  Copyright © 2017 eastgate. All rights reserved.
//

import UIKit

class UserRepository: UserRepositoryProtocol {
    func loginWithNormalUser(email: String, password: String) -> Bool {
        if email == "admin@gmail.com" && password == "123456" {
            return true
        }
        return false
    }
    
    func fetchAllUser() -> [UserEntity] {
        var arrUsers = [UserEntity]()
        for index in 0..<5 {
            let userEntity = UserEntity(email: "Email \(index)", password: "Password \(index)")
            arrUsers.append(userEntity)
        }
        
        return arrUsers
    }
}
