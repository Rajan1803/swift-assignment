//
//  CLLocationVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 27/05/23.
//
import MapKit
import UIKit

class CLLocationVC: BaseViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Enum for constants in this file
    enum Constant {
        static let defaultCoordinates =  CLLocationCoordinate2D(latitude: 23.121428105460183, longitude: 73.06097844941193)
        static let regionMeters: Double = 1000
    }
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        setViews()
    }
  
    // MARK: - Set up
    private func setViews() {
        LocationHelper.shared.startUpdatingLocation()
        let annotaion = MKPointAnnotation()
        annotaion.coordinate = LocationHelper.shared.currentLocation?.coordinate ?? Constant.defaultCoordinates
        mapView.addAnnotation(annotaion)
        LocationHelper.shared.onLocationUpdate = { [weak self] in
            guard let self else { return }
            self.mapView.removeAnnotations(self.mapView.annotations)
            let annotaion = MKPointAnnotation()
            annotaion.coordinate = $0.coordinate
            self.mapView.addAnnotation(annotaion)
            let region = MKCoordinateRegion(center: $0.coordinate , latitudinalMeters: Constant.regionMeters, longitudinalMeters: Constant.regionMeters)
            self.mapView.setRegion(region, animated: true)
            LocationHelper.shared.stopUpdatingLocation()
        }
    }
    
}
