//
//  ViewController.swift
//  Tutorial_MapKit_CoreLocation
//
//  Created by Tommy Ryanto on 01/07/19.
//  Copyright © 2019 Tommy Ryanto. All rights reserved.
//

import UIKit
//masukin library map nya dlu
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationCoordinate = locations.last! as CLLocation
        
        //tentukan location dari map nya dlu (pakai coordinate latitude dan longitude)
        let location = CLLocationCoordinate2D(latitude: locationCoordinate.coordinate.latitude, longitude: locationCoordinate.coordinate.longitude)
        
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        self.mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Green Office Park"
        mapView.addAnnotation(annotation)
    }

}

