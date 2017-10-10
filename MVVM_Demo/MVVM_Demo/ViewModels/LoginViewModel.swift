//
//  LoginViewModel.swift
//  MVVM_Demo
//
//  Created by Mai Hoang Anh on 10/5/17.
//  Copyright © 2017 eastgate. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class LoginViewModel: BaseViewModel {
    
    private var _loginService: LoginServiceProtocol!
    
    init(loginService: LoginServiceProtocol) {
        super.init()
        _loginService = loginService
    }
    
    override func applyBinding() {
        
    }
    
}

