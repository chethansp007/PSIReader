//
//  NetworkService.swift
//  Data
//
//  Created by Chethan SP on 23/1/18.
//  Copyright © 2018 Chethan SP. All rights reserved.
//

import Foundation

enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
}

enum ErrorType : Error {
    case invalidURL
    case jsonDataNotFound
}

protocol NetworkServiceProtocol {
    func url() ->  String
    func httpMethodType() ->  String
    func body() -> Data?
    func apiName() -> String
    func header() -> [String:String]
}


 class NetworkService {
    
    static let shared = NetworkService()
    
    func performRequest(urlString:String,
                        type:String,
                        header:[String:String],
                        body:Data?,
                        complition:@escaping(_ data:Any?, _ respone:URLResponse?, _ eror:Error?) -> Void) {
        
        guard let url:URL = URL(string: urlString) else{
            complition(nil,nil,ErrorType.invalidURL)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = type
        
        for (key,value) in header {
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        if nil != body{
            request.httpBody = body
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

            guard error == nil else {
                complition(nil,response,error)
                return
            }
            
            guard let content = data else {
                complition(nil,response,error)
                return
            }
            
            guard let json = try? JSONSerialization.jsonObject(with: content, options: []) as? [String : Any] else {
                complition(nil,response,ErrorType.jsonDataNotFound)
                return
            }
            
            complition(json,response,nil)
        }
        task.resume()
    }
}
