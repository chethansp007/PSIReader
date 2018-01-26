//
//  Region.swift
//  Data
//
//  Created by Chethan SP on 26/1/18.
//  Copyright © 2018 Chethan SP. All rights reserved.
//

import Foundation
import CoreLocation

public class RegionBuilder {
    
    public var regions: [Region] = []
    
    
    init(dict:[String:Any])   {
        
        guard let region = dict["region_metadata"] as? [[String:Any]] else {
            return
        }
        
        for regnDict in region {
            if  let regn = try? Region(dict: regnDict) {
                regions.append(regn)
            }
        }
        
        guard let itemsList = (((dict["items"] as? [Any])?.first) as? [String:Any]),
            let readings = itemsList["readings"] as? [String:Any] else {
                return
        }
        
        for (key,values) in readings {
            
            if let entries = values as? [String:Any] {
                
                for (region,value) in entries {
                    
                    if let region = self.regions.filter({ $0.name == region}).first,
                        let val = value as? Double {
                        let item = Items(type: key, value: val)
                        region.items.append(item)
                    }
                }
            }
        }
    }
}

public class Region {
    
    public var latitude: CLLocationDegrees
    public var longitude:CLLocationDegrees
    public var name:String
    public var items : [Items] = []
    
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



public struct Items {
    public var type : String
    public var value : Double
    
    init(type:String,value:Double) {
        self.type = type
        self.value = value
    }
}
