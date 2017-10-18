//
//  HomeServiceProtocol.swift
//  MVVM_Demo
//
//  Created by Anh Mai on 10/18/17.
//  Copyright © 2017 eastgate. All rights reserved.
//

import Foundation

protocol HomeServiceProtocol: class {
    func fetchAllUser() -> [UserEntity]
}
