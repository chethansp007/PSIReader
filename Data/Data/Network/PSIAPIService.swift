//
//  PSIAPIService.swift
//  Data
//
//  Created by Chethan SP on 26/1/18.
//  Copyright © 2018 Chethan SP. All rights reserved.
//

import Foundation

public class PSIAPIService: APIServiceProtocol {
    
    let date : Date
    
    public init(date:Date) {
        self.date = date
    }
    
    // MARK: NetworkServiceProtocol
    func url() -> String {
        
        let dateTime = Date().toString(dateFormat: "yyyy-MM-dd'T'HH:mm:ss").addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let date = Date().toString(dateFormat: "yyyy-MM-dd")
        let url = "\(Constants.URLConfig.domain)/\(Constants.URLConfig.version)/environment/psi?date_time=\(dateTime)&date=\(date)"
        return url
    }
    
    func httpMethodType() -> String {
        return HTTPMethod.get.rawValue
    }
    
    func body() -> Data? {
        return nil
    }
    
    func apiName() -> String {
        return Constants.APIName.psiService
    }
    
    func header() -> [String:String] {
        return ["api-key" : Constants.ClientConfig.appKey]
        
    }
    
    //MARK: -
    func parse(data:[String:Any], response:URLResponse?) -> RegionBuilder  {
        return RegionBuilder(dict: data)
    }
    
    public func getPSIData(complition:@escaping(_ data:RegionBuilder?,_ eror:Error?) -> Void) {
        
        NetworkSession.shared.performRequest(urlString: self.url(),
                                             type: self.httpMethodType(),
                                             header: self.header(),
                                             body: self.body()) { (data, response, error) in
                                                
                                                if let err = error {
                                                    complition(nil,err)
                                                    return
                                                }
                                                
                                                guard let data = data as? [String:Any] else {
                                                    complition(nil,error)
                                                    return
                                                }
                                                
                                               let builder = self.parse(data: data, response: response)
                                               complition(builder,error)
                                                
        }
    }
}
