//
//  Places.swift
//  App
//
//  Created by Chethan SP on 27/1/18.
//  Copyright © 2018 Chethan SP. All rights reserved.
//

import MapKit
import  Data

@objc class Place: NSObject {
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String?, subtitle: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
    
    static func getPlaces(regions:[Region]) -> [Place] {
       
        var places = [Place]()
        
        for region in regions {
            let title = region.name
            let place = Place(title: title, subtitle: "", coordinate: CLLocationCoordinate2DMake(region.latitude, region.longitude))
            places.append(place)
        }
        
        return places as [Place]
    }
}

extension Place: MKAnnotation {
    
}
