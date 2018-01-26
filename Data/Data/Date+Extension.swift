//
//  Date+Extension.swift
//  Data
//
//  Created by Chethan SP on 26/1/18.
//  Copyright © 2018 Chethan SP. All rights reserved.
//

import Foundation

extension Date {
    
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
