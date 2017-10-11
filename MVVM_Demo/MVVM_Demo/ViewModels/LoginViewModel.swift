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
    
    var didPressButton: Observable<Bool> = Observable.never()
    
    var isValidObservable: Observable<Bool> {
        return Observable.combineLatest(email.asObservable(), password.asObservable(), resultSelector: { (emailText, passwordText) -> Bool in
            return Validataion.validateEmail(email: emailText) && Validataion.validatePassword(email: passwordText)
        })
    }
    
    init(loginService: LoginServiceProtocol) {
        super.init()
        _loginService = loginService
    }
    
    override func applyBinding() {
        
    }
    
}

