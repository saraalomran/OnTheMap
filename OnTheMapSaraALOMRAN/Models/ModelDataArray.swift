//
//  ModelDataArray.swift
//  OnTheMapSaraALOMRAN
//
//  Created by Sara Alomran on 11/02/2019.
//  Copyright © 2019 Sara Alomran. All rights reserved.
//

import Foundation

class ModelDataArray {
    static let shared = ModelDataArray()
    
    var usersDataArray = [Any?]()
    
    private init() { }
}
