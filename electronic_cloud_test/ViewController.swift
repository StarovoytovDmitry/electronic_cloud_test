//
//  ViewController.swift
//  electronic_cloud_test
//
//  Created by Дмитрий on 06.08.17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        users = DataManager.parseData()
        print(users)
    }

}

