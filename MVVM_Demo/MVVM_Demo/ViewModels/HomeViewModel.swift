//
//  HomeViewModel.swift
//  MVVM_Demo
//
//  Created by Anh Mai on 10/18/17.
//  Copyright © 2017 eastgate. All rights reserved.
//

import UIKit

class HomeViewModel: BaseViewModel {
    private var _homeService: HomeServiceProtocol!
    
    init(homeService: HomeServiceProtocol) {
        _homeService = homeService
    }
    
}
