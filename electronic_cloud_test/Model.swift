//
//  Model.swift
//  electronic_cloud_test
//
//  Created by Дмитрий on 06.08.17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class User {
    let number: Int
    let name: String
    let status: Bool
    
    init(number: Int, name: String, status: Bool) {
        self.number = number
        self.name = name
        self.status = status
    }
}
