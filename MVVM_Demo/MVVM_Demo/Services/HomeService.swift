//
//  HomeService.swift
//  MVVM_Demo
//
//  Created by Anh Mai on 10/18/17.
//  Copyright © 2017 eastgate. All rights reserved.
//

import UIKit

class HomeService: HomeServiceProtocol {
    private var _userRepository: UserRepositoryProtocol!
    
    init(userRepository: UserRepositoryProtocol) {
        _userRepository = userRepository
    }
    
    func fetchAllUser() -> [UserEntity] {
        return _userRepository.fetchAllUser()
    }
}
