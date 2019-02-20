//
//  StudentLocations.swift
//  OnTheMapSaraALOMRAN
//
//  Created by Sara Alomran on 11/02/2019.
//  Copyright © 2019 Sara Alomran. All rights reserved.
//

import Foundation

struct StudentLocations : Codable {
    let results : [Results]?
}
//-----------------------------------------------------------


struct StudentLocationsBody : Codable {
    let uniqueKey:String?
    let firstName:String?
    let lastName:String?
    let mapString:String?
    let mediaURL:String?
    let latitude:Double?
    let longitude:Double?
}
//-----------------------------------------------------------

struct Results : Codable {
    let createdAt:String?
    let firstName:String?
    let lastName:String?
    let latitude:Double?
    let longitude:Double?
    let mapString:String?
    let mediaURL:String?
    let uniqueKey:String?
    let updatedAt:String?
    let objectId:String?
    
}
//-----------------------------------------------------------


struct StudentLocationsResponse : Codable {
    let createdAt : String?
    let objectId : String?
    
}
//-----------------------------------------------------------

struct StudentLocationsUpdateResponse : Codable {
    let createdAt : String?
}

//-----------------------------------------------------------

