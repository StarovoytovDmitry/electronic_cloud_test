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
    
    struct TableView {
        static let cellIdentifier = "userCell"
        static let cellName = "UserTableViewCell"
    }
    
    lazy var tableView: UITableView = {
        var tv = UITableView(frame: self.view.bounds, style: UITableViewStyle.plain)
        tv.delegate = self
        tv.dataSource = self
        tv.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        let nib = UINib(nibName: TableView.cellName, bundle: nil)
        tv.register(nib, forCellReuseIdentifier: TableView.cellIdentifier)
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        users = DataManager.parseData()
    }

    deinit {
        tableView.delegate = nil
        tableView.dataSource = nil
    }
    
}

// Mark: UITableView Data Source
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableView.cellIdentifier, for: indexPath) as! UserTableViewCell
        let user = users[indexPath.row]
        cell.configueCell(name: user.name, status: user.status)
        return cell
    }
}

// Mark: UITableView Delegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
