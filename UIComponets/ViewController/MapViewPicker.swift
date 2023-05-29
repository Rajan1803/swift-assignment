//
//  MapViewPicker.swift
//  UIComponets
//
//  Created by Rajan Patel on 27/05/23.
//

import UIKit
import MapKit

class MapViewPicker: UIViewController {

    // MARK: - Enum for constants used in this file
    enum Constant {
        static let topInsets: CGFloat = 50
        static let bottomInsets: CGFloat = 50
        static let leftInsets: CGFloat = 50
        static let rightinsets: CGFloat = 50
        static let numberOfComponents = 2
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var pickerVLocation: UIPickerView!
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // function for drawing route beetween two coordinates
    private func drawRoute(source: CLLocationCoordinate2D, destination: CLLocationCoordinate2D) {
        mapView.removeAnnotations(mapView.annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = source
        mapView.addAnnotation(annotation)
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = destination
        mapView.addAnnotation(annotation2)
        mapView.removeOverlays(mapView.overlays)
        
        let sourcePlacemark = MKPlacemark(coordinate: source)
        let destinationPlacemark = MKPlacemark(coordinate: destination)

        let sourseMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)

        let directionRequest = MKDirections.Request()
        directionRequest.source = sourseMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile

        let directions = MKDirections(request: directionRequest)

        directions.calculate { [weak self] response , error in
            guard let self = self else {
                return
            }

            if let error  {
                print("Error calculating route: \(error.localizedDescription)")
            } else if let response = response, let route = response.routes.first {
                self.mapView.addOverlay(route.polyline,level: .aboveRoads)
                let routeRect = route.polyline.boundingMapRect
                let routeRectWithPadding = self.mapView.mapRectThatFits(routeRect, edgePadding: UIEdgeInsets(top: Constant.topInsets, left: Constant.leftInsets, bottom: Constant.bottomInsets, right: Constant.rightinsets))
                self.mapView.setRegion(MKCoordinateRegion(routeRectWithPadding), animated: true)
            }
        }
    }

}

// MARK: Extension for MapViewPicker
extension MapViewPicker: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        Location.locations.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return Constant.numberOfComponents
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Location.locations[row].place
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let sourceLocation = Location.locations[pickerView.selectedRow(inComponent: 0)]
        let destinationLocation = Location.locations[pickerView.selectedRow(inComponent: 1)]
        self.drawRoute(source: CLLocationCoordinate2D(latitude: sourceLocation.latitude, longitude: sourceLocation.longitude), destination: CLLocationCoordinate2D(latitude: destinationLocation.latitude, longitude: destinationLocation.longitude))
    }
    
}

// MARK: Extension for MapViewPicker
extension MapViewPicker: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .blue
            renderer.lineWidth = 3
            return renderer
        }
        return MKPolylineRenderer(overlay: overlay)
    }
    
}
