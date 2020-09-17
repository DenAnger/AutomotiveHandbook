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
    
    let car = Car(yearOfIssue: "Foo",
                  manufacture: "Bar",
                  model: "Baz",
                  bodyType: "Bat")

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testInitCarWithParameters() {
        XCTAssertNotNil(car)
    }
    
    func testWhenGivenCarParameters() {
        XCTAssertEqual(car.yearOfIssue, "Foo")
        XCTAssertEqual(car.manufacture, "Bar")
        XCTAssertEqual(car.model, "Baz")
        XCTAssertEqual(car.bodyType, "Bat")
    }
}
