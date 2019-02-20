//
//  OTMUdacityConstants.swift
//  OnTheMapSaraALOMRAN
//
//  Created by Sara Alomran on 11/02/2019.
//  Copyright © 2019 Sara Alomran. All rights reserved.
//


extension OTMUdacityClient {
    
    // MARK: Constants
    struct Constants {
        
        
        // MARK: URLs
        static let ApiScheme = "https"
        static let ApiHost = "onthemap-api.udacity.com"
        static let ApiPath = "/v1"
        
    }
    
    // MARK: URL Keys
    struct URLKeys {
        static let UserID = "id"
    }
    
    // MARK: Methods
    struct Methods {
        
        
        // MARK: Authentication
        static let AuthenticationSession = "/session"
        static let AuthenticationGetPublicDataForUserID = "/users/{id}"
        
        
        
    }
    
    
    
    
}
