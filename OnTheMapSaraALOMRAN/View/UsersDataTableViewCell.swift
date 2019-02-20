//
//  UsersDataTableViewCell.swift
//  OnTheMapSaraALOMRAN
//
//  Created by Sara Alomran on 11/02/2019.
//  Copyright © 2019 Sara Alomran. All rights reserved.
//

import UIKit

class UsersDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    
    func fillCell(usersData: Results) {
        
        if let frist = usersData.firstName , let last = usersData.lastName , let url = usersData.mediaURL {
            
            fullNameLabel.text = "\(frist) \(last)"
            urlLabel.text = "\(url)"
            
        }
    }
    
    
    
}
