//
//  Readings.swift
//  Data
//
//  Created by Chethan SP on 27/1/18.
//  Copyright © 2018 Chethan SP. All rights reserved.
//

import Foundation

public struct Readings {
    public var type : String
    public var value : Double
    
    init(type:String,value:Double) {
        self.type = type
        self.value = value
    }
}
