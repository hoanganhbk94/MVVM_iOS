//
//  BaseView.swift
//  MVVM_Demo
//
//  Created by Mai Hoang Anh on 10/5/17.
//  Copyright © 2017 eastgate. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BaseView: UIViewController {
    let disposeBag = DisposeBag()
    
    init(nibName: String) {
        super.init(nibName: nibName, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createBindingViews()
    }
    
    func createBindingViews() {
    }
}

