//
//  APIServiceProtocol.swift
//  Data
//
//  Created by Chethan SP on 27/1/18.
//  Copyright © 2018 Chethan SP. All rights reserved.
//

import Foundation

protocol APIServiceProtocol {
    func url() ->  String
    func httpMethodType() ->  String
    func body() -> Data?
    func apiName() -> String
    func header() -> [String:String]
}
