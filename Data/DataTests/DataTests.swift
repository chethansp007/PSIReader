//
//  DataTests.swift
//  DataTests
//
//  Created by Chethan SP on 23/1/18.
//  Copyright © 2018 Chethan SP. All rights reserved.
//

import XCTest
@testable import Data

class DataTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPSIAPIService()  {
        let expect = expectation(description: "PSIAPIService")

        PSIAPIService(date: Date()).getPSIData { (data, error) in
            
            guard nil == error else {
                XCTFail(error.debugDescription)
                return
            }
     
             expect.fulfill()
        }
        
        waitForExpectations(timeout: 6, handler: nil)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
