//
//  Readings+Extension.swift
//  Domain
//
//  Created by Chethan SP on 27/1/18.
//  Copyright © 2018 Chethan SP. All rights reserved.
//

import Foundation
import Data

public extension Readings {
    
    public enum AlertType {
        
        case normal
        case moderate
        case unhealthy
        case veryunheathy
        case hazadous
        case none
        
        public var img : UIImage {
            switch self {
            case .normal:
                return #imageLiteral(resourceName: "Normal")
            case .moderate:
                return #imageLiteral(resourceName: "Moderate")
            case .unhealthy:
                return #imageLiteral(resourceName: "UnHealthy")
            case .veryunheathy:
                return #imageLiteral(resourceName: "Veryunheathy")
            case .hazadous:
                return #imageLiteral(resourceName: "Hazadous")
            default:
                return #imageLiteral(resourceName: "Normal")
            }
        }
    }
    
    func alertType() -> AlertType {
        
        switch self.value {
            
        case 0...50:
            return AlertType.normal
            
        case 51...100:
            return AlertType.moderate
            
        case 101...200:
            return AlertType.unhealthy
            
        case 201...300:
            return AlertType.veryunheathy
            
        case let x where x > 301:
            return AlertType.hazadous
            
        default:
            return AlertType.none
        }
    }
}
