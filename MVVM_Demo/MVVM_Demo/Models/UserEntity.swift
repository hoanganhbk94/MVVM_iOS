//
//  UserEntity.swift
//  MVVM_Demo
//
//  Created by Mai Hoang Anh on 10/5/17.
//  Copyright © 2017 eastgate. All rights reserved.
//

import Foundation

class UserEntity: BaseEntity {
    
    var email: String = ""
    var password: String = ""
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
}
