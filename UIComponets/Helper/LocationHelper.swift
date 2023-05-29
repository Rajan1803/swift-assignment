//
//  LocationHelper.swift
//  UIComponets
//
//  Created by Rajan Patel on 27/05/23.
//

import CoreLocation

class LocationHelper: NSObject, CLLocationManagerDelegate {
    
    // MARK: - Variables And Declarations
    private var clLocationManager = CLLocationManager()
    static let shared = LocationHelper()
    
    override private init() {
        clLocationManager = CLLocationManager()
        super.init()
        clLocationManager.delegate = self
        clLocationManager.desiredAccuracy = kCLLocationAccuracyBest
        clLocationManager.requestAlwaysAuthorization()
        
    }
    
    // MARK: - Properties
    var currentLocation: CLLocation?
    var onLocationUpdate: ((CLLocation) -> Void)?
    var onErrorUpdate: ((Error) -> Void)?
    
    func startUpdatingLocation() {
        self.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        self.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print(#function)
            currentLocation = location
            onLocationUpdate?(location)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        onErrorUpdate?(error)
    }
    
}
