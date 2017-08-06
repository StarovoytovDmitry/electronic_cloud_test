//
//  DataManager.swift
//  electronic_cloud_test
//
//  Created by Дмитрий on 06.08.17.
//  Copyright © 2017 test. All rights reserved.
//

import Foundation
import SwiftyJSON

class DataManager {
    
    class func getDataFromFileWithSuccess(_ success: ((_ data: Data) -> Void)) {
        let filePath = Bundle.main.path(forResource: "data",ofType:"json")
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: filePath!),
                                options: NSData.ReadingOptions.uncached)
            success(data)
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        } catch {
            fatalError()
        }
    }
    
    class func parseData() -> [User] {
        var users: [User] = []
        DataManager.getDataFromFileWithSuccess { (data) in
            let json = JSON(data: data)
            for user in json {
                let number: Int? = Int(user.0)
                let name: String? = user.1["name"].string
                let online: String? = user.1["status"].string
                var status = false
                if online == "online" {
                    status = true
                }
                if let number = number, let name = name {
                    let new = User(number: number, name: name, status: status)
                    users.append(new)
                }
            }
        }
        return(users)
    }
}
