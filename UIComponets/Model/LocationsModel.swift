//
//  LocationsModel.swift
//  UIComponets
//
//  Created by Rajan Patel on 27/05/23.
//

import Foundation

struct Location {
    
    // MARK: - Properties
    let place: String
    let longitude: Double
    let latitude: Double
    
    static var locations: [Location] = [
                                        Location(place: "Ahmedabad", longitude:  72.6004383270442, latitude: 23.065962001230737),
                                         Location(place: "Kapadwanj", longitude: 73.07036132521769, latitude: 23.02028868693592 ),
                                         Location(place: "Modasa", longitude: 73.29888607852128, latitude: 23.46477613207632 )]
    
}
