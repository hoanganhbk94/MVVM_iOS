//
//  BaseViewModel.swift
//  MVVM_Demo
//
//  Created by Mai Hoang Anh on 10/5/17.
//  Copyright © 2017 eastgate. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class BaseViewModel: NSObject {

    let disposeBag = DisposeBag()
    
    override init() {
        super.init()
    }
    
}
