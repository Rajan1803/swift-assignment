//
//  MapViewVC.swift
//  UIComponets
//
//  Created by Rajan Patel on 27/05/23.
//

import UIKit
import MapKit

class MapViewVC: BaseViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Enum for constant coordinates
    enum Constant {
        static let topInsets: CGFloat = 50
        static let bottomInsets: CGFloat = 50
        static let leftInsets: CGFloat = 50
        static let rightinsets: CGFloat = 50
        static let sourceCoordinates = CLLocationCoordinate2D(latitude: 23.121428105460183, longitude: 73.06097844941193)
        static let destinationCoordinates = CLLocationCoordinate2D(latitude: 22.951200769511196, longitude: 73.11169156330101)
        static let routeLineWidth: CGFloat = 3
    }
    
    // MARK: - Life cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    // MARK: - Set up
    private func setViews() {
        mapView.delegate = self
        drawRoute(source: Constant.sourceCoordinates, destination:Constant.destinationCoordinates)
    }
    
    // function to draw route beetween two coordinates
    private func drawRoute(source: CLLocationCoordinate2D, destination: CLLocationCoordinate2D) {
        
        let sourceAnnotation = MKPointAnnotation()
        sourceAnnotation.coordinate = source
        mapView.addAnnotation(sourceAnnotation)
        let destinationAnnotation = MKPointAnnotation()
        destinationAnnotation.coordinate = destination
        mapView.addAnnotation(destinationAnnotation)
        
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
                let routeRectWithPadding = self.mapView.mapRectThatFits(routeRect, edgePadding:UIEdgeInsets(top: Constant.topInsets, left: Constant.leftInsets, bottom: Constant.bottomInsets, right: Constant.rightinsets))
                self.mapView.setRegion(MKCoordinateRegion(routeRectWithPadding), animated: true)
            }
        }
    }
    
}

// MARK: Extension
extension MapViewVC: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .blue
            renderer.lineWidth = Constant.routeLineWidth
            return renderer
        }
        return MKPolylineRenderer(overlay: overlay)
    }
    
}
