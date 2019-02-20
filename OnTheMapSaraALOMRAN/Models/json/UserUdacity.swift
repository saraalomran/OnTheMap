//
//  UserUdacity.swift
//  OnTheMapSaraALOMRAN
//
//  Created by Sara Alomran on 11/02/2019.
//  Copyright © 2019 Sara Alomran. All rights reserved.
//

import Foundation

struct UdacitySessionBody : Codable {
    let udacity : Udacity
}
//-----------------------------------------------------------

struct Udacity : Codable {
    let username:String
    let password:String
}
//-----------------------------------------------------------

struct UdacitySessionResponse : Codable {
    let account : Account
    let session : Session
    
}
//-----------------------------------------------------------

struct Account : Codable {
    let registered : Bool?
    let key : String?
}
//-----------------------------------------------------------

struct SessionDelete : Codable {
    let session : Session
}
//-----------------------------------------------------------

struct Session : Codable {
    let id : String?
    let expiration : String?
}
//-----------------------------------------------------------

struct UdacityUserData : Codable {
    let nickname : String?

}
//-----------------------------------------------------------





