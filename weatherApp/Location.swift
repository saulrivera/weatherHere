//
//  Location.swift
//  weatherApp
//
//  Created by Saul Rivera on 7/14/17.
//  Copyright © 2017 Dymtech. All rights reserved.
//

import CoreLocation

class Location {
    
    static var sharedInstance = Location()
    private init() {}
    
    var latitud: Double!
    var longitud: Double!
    
}
