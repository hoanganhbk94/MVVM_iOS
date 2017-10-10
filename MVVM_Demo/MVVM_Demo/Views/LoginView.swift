//
//  LoginView.swift
//  MVVM_Demo
//
//  Created by Mai Hoang Anh on 10/5/17.
//  Copyright © 2017 eastgate. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginView: BaseView {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    private var _loginViewModel: LoginViewModel!
    
    init(nibName: String, loginViewModel: LoginViewModel) {
        super.init(nibName: nibName)
        
        _loginViewModel = loginViewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let emailObservable: Observable<String?> = self.emailTextField.rx.text.asObservable()
        let passwordObservable: Observable<String?> = self.passwordTextField.rx.text.asObservable()
        
        let resultObservable: Observable<String> = Observable.combineLatest(emailObservable, passwordObservable, resultSelector: { (email, password) -> String in
            return email! + " - " + password!
        })
        resultObservable.bind(to: self.resultLabel.rx.text).addDisposableTo(disposeBag)
        
        let emailValidObservable: Observable<EmailValid> = emailObservable.map({ email -> EmailValid in
            if email == "" {
                return EmailValid.empty
            }
            if !Validataion.validateEmail(email: email!) {
                return EmailValid.invalid
            }
            return EmailValid.valid
        })
        
        let passwordValidObservable: Observable<PasswordValid> = passwordObservable.map({ password -> PasswordValid in
            if password == "" {
                return PasswordValid.empty
            }
            if !Validataion.validateEmail(email: password!) {
                return PasswordValid.invalid
            }
            return PasswordValid.valid
        })
        
        let validDataObservable: Observable<Bool> = Observable.combineLatest(emailValidObservable, passwordValidObservable) { (emailValid, passwordValid) -> Bool in
            if emailValid == EmailValid.valid && passwordValid == PasswordValid.valid {
                return true
            }
            return false
        }
        
        validDataObservable.bind(to: self.loginButton.rx.isEnabled).addDisposableTo(disposeBag)
        
        self.loginButton.rx.tap.subscribe(onNext: { _ in
            self.showAlertView(title: "Sucess", message: "Login successful")
        }).addDisposableTo(disposeBag)
    }
    
    func showAlertView(title: String, message: String) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertView.addAction(okAction)
        self.present(alertView, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func createBindingViews() {
        _loginViewModel.applyBinding()
    }
    
}
