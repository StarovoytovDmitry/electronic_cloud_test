//
//  UserTableViewCell.swift
//  electronic_cloud_test
//
//  Created by Дмитрий on 06.08.17.
//  Copyright © 2017 test. All rights reserved.
//

import UIKit

class RoundedView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius: CGFloat = self.bounds.size.width / 2.0
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}

class BorderedRoundedView: RoundedView {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.white.cgColor
    }
}

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var shortNameLabel: UILabel!
    @IBOutlet weak var indicatorView: BorderedRoundedView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configueCell(name: String, status: Bool) {
        shortNameLabel.text = getShortName(name: name)
        nameLabel.text = name
        if status == true {
            indicatorView.backgroundColor = UIColor.green
            statusLabel.text = "Online"
            statusLabel.textColor = UIColor.green
        } else {
            indicatorView.backgroundColor = UIColor.red
            statusLabel.text = "Offline"
            statusLabel.textColor = UIColor.red
        }
    }
    
    func getShortName(name: String) -> String {
        var short = ""
        let names = name.components(separatedBy: " ")
        if names.count == 1 {
            short = String(names[0].characters.prefix(2)).uppercased()
        } else {
            short = String(names[0].characters.prefix(1)+names[1].characters.prefix(1))
        }
        return short
    }
    
}
