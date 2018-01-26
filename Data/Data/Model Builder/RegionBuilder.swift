//
//  RegionBuilder.swift
//  Data
//
//  Created by Chethan SP on 27/1/18.
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
                        let item = Readings(type: key, value: val)
                        region.items.append(item)
                    }
                }
            }
        }
    }
}
