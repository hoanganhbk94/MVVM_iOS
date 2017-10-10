//
//  Validation.swift
//  MVVM_Demo
//
//  Created by Mai Hoang Anh on 10/10/17.
//  Copyright © 2017 eastgate. All rights reserved.
//

import Foundation

class Validataion {
    
    static func validateEmail(email: String) -> Bool {
        if email.contains("#") {
            return false
        }
        return true
    }
    
}
