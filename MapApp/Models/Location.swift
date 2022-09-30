//
//  Location.swift
//  MapApp
//
//  Created by Prashant Singh chauhan on 1/21/22.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
   
    // Identifiable
    var id: String {name + cityName}
    
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String

    // Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}




