//
//  APIInterface.swift
//  Domain
//
//  Created by Chethan SP on 23/1/18.
//  Copyright © 2018 Chethan SP. All rights reserved.
//

import Foundation
import Data

public class  APIInterface {
    
    public static let shared = APIInterface()
    
    public func getPSIData(complition:@escaping(_ data:[Region],_ eror:Error?) -> Void)  {
        
        PSIAPIService(date: Date()).getPSIData { (builder, error) in
            
            guard nil == error, let builder = builder else {
                DispatchQueue.main.async {
                    complition([],error)
                }
                return
            }
            
            DispatchQueue.main.async {
                complition(builder.regions,error)
            }
        }
    }
}
