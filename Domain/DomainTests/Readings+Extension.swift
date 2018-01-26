//
//  Readings+Extension.swift
//  DomainTests
//
//  Created by Chethan SP on 27/1/18.
//  Copyright © 2018 Chethan SP. All rights reserved.
//

import XCTest
import Data

class Readings_Extension: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func test()  {
        var reading = Readings(type:"PSI",value:2)
        var type:Readings.AlertType = reading.alertType()
        XCTAssert(type == .normal, "Must be normal")
        
        reading = Readings(type:"PSI",value:52)
        type = reading.alertType()
        XCTAssert(type == .moderate, "Must be moderate")
        
        reading = Readings(type:"PSI",value:124)
        type = reading.alertType()
        XCTAssert(type == .unhealthy, "Must be unHealthy")
        
        reading = Readings(type:"PSI",value:240)
        type = reading.alertType()
        XCTAssert(type == .veryunheathy, "Must be veryunheathy")
        
        reading = Readings(type:"PSI",value:350)
        type = reading.alertType()
        XCTAssert(type == .hazadous, "Must be hazadous")
        
        reading = Readings(type:"PSI",value:-1)
        type = reading.alertType()
        XCTAssert(type == .none, "Must be none")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
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
