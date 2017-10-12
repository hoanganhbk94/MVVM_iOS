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
    
    var email = Variable<String>("")
    var password = Variable<String>("")
    
    var result: Observable<String> {
        return Observable.combineLatest(email.asObservable(), password.asObservable(), resultSelector: { (emailText, passwordText) -> String in
            if emailText == "" {
                return passwordText
            } else if passwordText == "" {
                return emailText
            } else {
                return "\(emailText) - \(passwordText)"
            }
        })
    }
    
    var isValidObservable: Observable<Bool> {
        return Observable.combineLatest(email.asObservable(), password.asObservable(), resultSelector: { (emailText, passwordText) -> Bool in
            return Validation.validateEmail(email: emailText) && Validation.validatePassword(email: passwordText)
        })
    }
    
    init(loginService: LoginServiceProtocol) {
        super.init()
        _loginService = loginService
    }
    
    func loginWithNormalUser() -> Bool {
        return _loginService.loginWithNormalUser(email: email.value, password: password.value)
    }
    
}

