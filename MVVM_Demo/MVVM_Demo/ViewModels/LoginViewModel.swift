//
//  LoginViewModel.swift
//  MVVM_Demo
//
//  Created by Mai Hoang Anh on 10/5/17.
//  Copyright © 2017 eastgate. All rights reserved.
//

import Foundation

class LoginViewModel: BaseViewModel {
    
    private var _email: String = ""
    private var _password: String = ""
    
    private var _loginService: LoginServiceProtocol!
    
    var email: String {
        get { return _email }
        set {
            _email = newValue
        }
    }
    
    var password: String {
        get { return _password }
        set {
            _password = newValue
        }
    }
    
    init(loginService: LoginServiceProtocol) {
        super.init()
        _loginService = loginService
    }
    
    func loginWithNormalUser(email: String, password: String, completeBlock: (_ success: Bool, _ message: String?) -> Void) {
        self.email = email
        self.password = password
        
        if !self.validData(completeBlock: completeBlock) {
            return
        }
        
        if _loginService!.loginWithNormalUser(email: email, password: password) {
            completeBlock(true, nil)
        } else {
            completeBlock(false, "Email or password is invalid")
        }
    }
    
    func validData(completeBlock: (_ success: Bool, _ message: String?) -> Void) -> Bool {
        if email == "" {
            completeBlock(false, "Email is empty")
            return false
        }
        if password == "" {
            completeBlock(false, "Password is empty")
            return false
        }
        return true
    }
    
}
