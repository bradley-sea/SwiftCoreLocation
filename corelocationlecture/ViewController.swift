//
//  ViewController.swift
//  corelocationlecture
//
//  Created by Bradley Johnson on 8/18/14.
//  Copyright (c) 2014 learnswift. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch CLLocationManager.authorizationStatus() as CLAuthorizationStatus {
        case .Authorized:
            println("great")
            self.locationManager.startUpdatingLocation()
        case .NotDetermined:
            println("not determined")
            self.locationManager.requestAlwaysAuthorization()
        case .Restricted:
            println("restricted bro")
        default:
            println("something else")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        
        switch status {
        case .Authorized:
        self.locationManager.startUpdatingLocation()
        default:
            println("uh oh")
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println("location did update")
        //last object in array is the most recent location update
        if let location = locations.last as? CLLocation {
            println(location.coordinate.latitude)
        }
        
    }


}

