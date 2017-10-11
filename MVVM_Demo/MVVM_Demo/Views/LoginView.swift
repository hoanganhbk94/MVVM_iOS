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
        self.emailTextField.rx.text.map { $0 ?? "" }.bind(to: _loginViewModel.email).addDisposableTo(disposeBag)
        self.passwordTextField.rx.text.map { $0 ?? "" }.bind(to: _loginViewModel.password).addDisposableTo(disposeBag)
        
        _loginViewModel.isValidObservable.bind(to: self.loginButton.rx.isEnabled).addDisposableTo(disposeBag)
        
        self.loginButton.rx.tap.subscribe(onNext: { _ in
            self.showAlertView(title: "Success", message: "Login successful")
        }).addDisposableTo(disposeBag)
        
        _loginViewModel.applyBinding()
    }
    
}
