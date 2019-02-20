//
//  FinalAddLocationViewController.swift
//  OnTheMapSaraALOMRAN
//
//  Created by Sara Alomran on 11/02/2019.
//  Copyright © 2019 Sara Alomran. All rights reserved.
//

import UIKit
import MapKit

class FinalAddLocationViewController: UIViewController {
    //-----------------------------------------------------------

    @IBOutlet weak var mapView: MKMapView!
    //-----------------------------------------------------------

    var mapString:String?
    var mediaURL:String?
    var latitude:Double?
    var longitude:Double?
    //-----------------------------------------------------------

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        
        createAnnotation()
        
    }
    
    //-----------------------------------------------------------

    
    @IBAction func finishTapped(_ sender: UIButton) {
        // if objectId == nil , it's mean this is the frist time the user post !
        if OTMParseClient.sharedInstance().objectId == nil {
            postNewStudentLocation()
        }else {
            // if objectId != nil , that mean the user will updating his post !
            updateStudentLocation()
            
        }
    }
    //-----------------------------------------------------------

    func postNewStudentLocation(){
        
        if let nickname = OTMUdacityClient.sharedInstance().nickname {
            var components = nickname.components(separatedBy: " ")
            if(components.count > 0)
            {
                let firstName = components.removeFirst()
                let lastName = components.joined(separator: " ")
                
                
                let jsonBody = StudentLocationsBody(uniqueKey:OTMUdacityClient.sharedInstance().userID! , firstName:firstName, lastName:lastName ,mapString:mapString!,mediaURL:mediaURL! ,latitude:latitude! , longitude:longitude!)
                
                
                OTMParseClient.sharedInstance().postUserLocation(jsonBody: jsonBody) { (success, errorString) in
                    
                    if success {
                        print(success)
                        
                        self.returnBackToRoot()
                        
                    }else {
                        Alert.showBasicAlert(on: self, with: errorString!.localizedCapitalized)
                    }
                    
                }
            }
            
        }
        
        
    }
    //-----------------------------------------------------------

    func updateStudentLocation(){
        
        if let fullName = OTMUdacityClient.sharedInstance().nickname {
            var components = fullName.components(separatedBy: " ")
            if(components.count > 0)
            {
                let firstName = components.removeFirst()
                let lastName = components.joined(separator: " ")
                
                
                let jsonBody = StudentLocationsBody(uniqueKey:OTMUdacityClient.sharedInstance().userID! , firstName:firstName, lastName:lastName ,mapString:mapString!,mediaURL:mediaURL! ,latitude:latitude! , longitude:longitude!)
                
                
                OTMParseClient.sharedInstance().putUserLocation(jsonBody: jsonBody) { (success, errorString) in
                    
                    if success {
                        print(success)
                        
                        self.returnBackToRoot()
                    }else {
                        Alert.showBasicAlert(on: self, with: errorString!.localizedCapitalized)
                    }
                    
                }
            }
            
        }
        
        
    }
    //-----------------------------------------------------------

    func returnBackToRoot() {
        DispatchQueue.main.async {
            self.tabBarController?.tabBar.isHidden = false
            if let navigationController = self.navigationController {
                navigationController.popToRootViewController(animated: true)
            }
        }
        
    }
    //-----------------------------------------------------------

    func createAnnotation(){
        let annotation = MKPointAnnotation()
        annotation.title = mapString!
        annotation.subtitle = mediaURL!
        annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
        self.mapView.addAnnotation(annotation)
        let coredinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coredinate, span: span)
        self.mapView.setRegion(region, animated: true)
        
    }
}
//-----------------------------------------------------------
