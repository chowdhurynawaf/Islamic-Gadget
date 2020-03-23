//
//  LocationViewController.swift
//  islamicGadgetArena
//
//  Created by Macbook on 16/02/2020.
//  Copyright © 2020 Shahid Sabir. All rights reserved.
//

import UIKit
import CoreLocation

var lan = 0.0

class LocationViewController: UIViewController , CLLocationManagerDelegate {
     
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    

    @IBAction func AcceptBtn(_ sender: Any) {
       
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
                   locationManager.delegate = self
                   locationManager.desiredAccuracy = kCLLocationAccuracyBest // You can change the locaiton accuary here.
                   locationManager.startUpdatingLocation()
            
               }
    
    }
    
    
    // Print out the location to the console
       func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           if let location = locations.last {
                performSegue(withIdentifier: "locationToSignIn", sender: self)
            
            
            if location.horizontalAccuracy > 0{
                locationManager.stopUpdatingLocation()
            }
            
            UserDefaults.standard.set(location.coordinate.latitude, forKey: "lat")
            UserDefaults.standard.set(location.coordinate.longitude,forKey: "lon")
            
            

           }
        
        
       }
       
       // If we have been deined access give the user the option to change it
       func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
           if(status == CLAuthorizationStatus.denied) {
               showLocationDisabledPopUp()
           }
       }
       
       // Show the popup to the user if we have been deined access
       func showLocationDisabledPopUp() {
           let alertController = UIAlertController(title: "Background Location Access Disabled",
                                                   message: "In order to show correct salat time we need your location",
                                                   preferredStyle: .alert)
           
           let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
           alertController.addAction(cancelAction)
           
           let openAction = UIAlertAction(title: "Open Settings", style: .default) { (action) in
            if let url = URL(string: UIApplication.openSettingsURLString) {
                   UIApplication.shared.open(url, options: [:], completionHandler: nil)
               }
           }
           alertController.addAction(openAction)
           
           self.present(alertController, animated: true, completion: nil)
       }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        AlertControl.showAlert(self, title: "OOps", message: "There was an issue retrieving your location")
    }
    

}
