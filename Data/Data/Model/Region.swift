//
//  Region.swift
//  Data
//
//  Created by Chethan SP on 26/1/18.
//  Copyright © 2018 Chethan SP. All rights reserved.
//

import Foundation
import CoreLocation

public class Region {
    
    public var latitude: CLLocationDegrees
    public var longitude:CLLocationDegrees
    public var name:String
    public var items : [Readings] = []
    
    init(latitude:Double, longitude:Double, name:String) {
        self.name = name
        self.latitude  = CLLocationDegrees(latitude)
        self.longitude  = CLLocationDegrees(longitude)
    }
    
    convenience init(dict:[String:Any]) throws {
        guard let name = dict["name"] as?  String,
            let location = dict["label_location"] as? [String:Any],
            let long =  location["longitude"] as? Double,
            let lat =  location["latitude"] as? Double else {
                throw ErrorType.jsonDataNotFound
        }
        self.init(latitude: lat, longitude: long, name: name)
    }
}
