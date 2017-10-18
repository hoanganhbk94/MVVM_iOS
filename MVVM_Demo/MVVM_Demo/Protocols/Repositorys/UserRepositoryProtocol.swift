//
//  UserRepositoryProtocol.swift
//  MVVM_Demo
//
//  Created by Anh Mai on 10/18/17.
//  Copyright © 2017 eastgate. All rights reserved.
//

import Foundation

protocol UserRepositoryProtocol: class {
    func loginWithNormalUser(email: String, password: String) -> Bool
    func fetchAllUser() -> [UserEntity]
}
