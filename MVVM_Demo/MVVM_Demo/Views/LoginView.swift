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
    
    private var _loginViewModel = LoginViewModel(loginService: LoginService(userRepository: UserRepository()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlertView(title: String, message: String) {
        let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertView.addAction(okAction)
        self.present(alertView, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func createBindingViews() {
        self.emailTextField.rx.text.map { $0 ?? "" }.bind(to: _loginViewModel.email).addDisposableTo(disposeBag)
        self.passwordTextField.rx.text.map { $0 ?? "" }.bind(to: _loginViewModel.password).addDisposableTo(disposeBag)
        
        _loginViewModel.isValidObservable.bind(to: self.loginButton.rx.isEnabled).addDisposableTo(disposeBag)
        _loginViewModel.result.bind(to: self.resultLabel.rx.text).addDisposableTo(disposeBag)
        
        self.loginButton.rx.tap.subscribe(onNext: { _ in
            if self._loginViewModel.loginWithNormalUser() {
                let homeView = HomeView(nibName: "HomeView")
                self.navigationController?.pushViewController(homeView, animated: true)
            } else {
                self.showAlertView(title: "Fail", message: "Login fail")
            }
        }).addDisposableTo(disposeBag)
        
    }
    
}
