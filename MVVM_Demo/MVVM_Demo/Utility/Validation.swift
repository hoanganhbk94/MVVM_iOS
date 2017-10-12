//
//  Validation.swift
//  MVVM_Demo
//
//  Created by Mai Hoang Anh on 10/10/17.
//  Copyright © 2017 eastgate. All rights reserved.
//

import Foundation

class Validation {
    
    static func validateEmail(email: String) -> Bool {
        if !email.contains("@") {
            return false
        }
        return true
    }
    
    static func validatePassword(email: String) -> Bool {
        if email.characters.count < 6 {
            return false
        }
        return true
    }
    
}
