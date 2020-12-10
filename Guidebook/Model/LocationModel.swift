//
//  LocationModel.swift
//  Guidebook
//
//  Created by W Lawless on 12/3/20.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable {
    var id:String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    //Computed Property
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
