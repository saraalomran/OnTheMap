//
//  UsersDataTableViewController.swift
//  OnTheMapSaraALOMRAN
//
//  Created by Sara Alomran on 11/02/2019.
//  Copyright © 2019 Sara Alomran. All rights reserved.
//

import UIKit
import SafariServices

class UsersDataTableViewController: UIViewController {
    
    
    //IBOUTLETS
    //-----------------------------------------------------------
    @IBOutlet weak var usersDataTableview: UITableView!
    
    var usersDataArray = ModelDataArray.shared.usersDataArray
    
    //-----------------------------------------------------------

    override func viewWillAppear(_ animated: Bool) {
        
        getAllUsersData()
    }
   
    //-----------------------------------------------------------
    func getAllUsersData(){
        usersDataArray.removeAll()

        ActivityIndicator.startActivityIndicator(view: self.view)
      
        OTMParseClient.sharedInstance().getAllDataFormUsers { (success, usersData, errorString) in
            
            
            if success {
                
                guard let newUsersData = usersData else {return}
                
                self.usersDataArray = newUsersData as! [Results]
                
                DispatchQueue.main.async {
                    ActivityIndicator.stopActivityIndicator()
                    
                    self.usersDataTableview.reloadData()
                }
                
            }else {
                DispatchQueue.main.async {
                    ActivityIndicator.stopActivityIndicator()
                }
                Alert.showBasicAlert(on: self, with: errorString!)
                
                
            }
            
        }
        
    }
    //-----------------------------------------------------------

    @IBAction func addLocationTapped(_ sender: Any) {
        OTMParseClient.sharedInstance().getuserDataByUniqueKey { (success, usersData, errorString) in
            
            if success {
                
              
                if usersData != nil {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toAddLocation", sender: nil)
                        
                    }
                }else {
                    
                    
                    Alert.showAlertWithTwoButtons(on: self, with: "User \(OTMUdacityClient.sharedInstance().nickname!) Has Already Posted a Stdent Location. Whould you Like to Overwrite Thier Location?", completionHandlerForAlert: { (action) in
                        
                        self.performSegue(withIdentifier: "toAddLocation", sender: nil)
                        
                    })
                    
                }
                
                
            }else {
                Alert.showBasicAlert(on: self, with: errorString!)
            }
        }
        
        
        
    }
    
    //-----------------------------------------------------------

    @IBAction func refreshTapped(_ sender: UIBarButtonItem) {
        getAllUsersData()
    }
    //-----------------------------------------------------------

    @IBAction func logoutTapped(_ sender: Any) {
        OTMUdacityClient.sharedInstance().deleteSession { (success, sessionID, errorString) in
            
            DispatchQueue.main.async {
                if success {
                    self.dismiss(animated: true, completion: nil)
                    
                }else {
                    Alert.showBasicAlert(on: self, with: errorString!)
                }
            }
            
        }
        
    }
    
    
}
//-----------------------------------------------------------

extension UsersDataTableViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return usersDataArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersDataCell") as! UsersDataTableViewCell
        
        
        cell.fillCell(usersData: usersDataArray[indexPath.row] as! Results)
        
        return cell
        
    }
    
    
}
//-----------------------------------------------------------

extension UsersDataTableViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dataArray = usersDataArray as! [Results]
        
        if let urlString = dataArray[indexPath.row].mediaURL,
            let url = URL(string: urlString){
            
            if url.absoluteString.contains("http://"){
                let svc = SFSafariViewController(url: url)
                present(svc, animated: true, completion: nil)
            }else {
                
                DispatchQueue.main.async {
                    Alert.showBasicAlert(on: self, with: "Cannot Open , Because it's Not Vailed Website !!")
                }            }
            
        }
    }
}
//-----------------------------------------------------------
