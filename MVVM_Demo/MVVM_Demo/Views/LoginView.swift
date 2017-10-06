//
//  LoginView.swift
//  MVVM_Demo
//
//  Created by Mai Hoang Anh on 10/5/17.
//  Copyright © 2017 eastgate. All rights reserved.
//

import UIKit

class LoginView: BaseView {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        _loginViewModel?.loginWithNormalUser(email: emailTextField.text!, password: passwordTextField.text!) { (success, message) in
            if success {
                print("Login success")
            } else {
                print(message ?? "")
            }
        }
    }

}
