//
//  CarTests.swift
//  AutomotiveHandbookTests
//
//  Created by Denis Abramov on 17.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import XCTest
@testable import AutomotiveHandbook

class CarTests: XCTestCase {
    
    var car: Car!

    override func setUpWithError() throws {
        car = Car(yearOfIssue: "Foo",
                      manufacturer: "Bar",
                      model: "Baz",
                      bodyType: "Bat")
    }

    override func tearDownWithError() throws {
        car = nil
    }
    
    func testInitCarWithParameters() {
        XCTAssertNotNil(car)
    }
    
    func testWhenGivenCarParameters() {
        XCTAssertEqual(car.yearOfIssue, "Foo")
        XCTAssertEqual(car.manufacturer, "Bar")
        XCTAssertEqual(car.model, "Baz")
        XCTAssertEqual(car.bodyType, "Bat")
    }
}
