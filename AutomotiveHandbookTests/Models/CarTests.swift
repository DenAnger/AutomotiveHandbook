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

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testInitCarWithParameters() {
        let car = Car(yearOfIssue: "Foo", manufacture: "Bar", model: "Baz", bodyType: "Bat")
        XCTAssertNotNil(car)
    }
    
    func testWhenGivenCarParameters() {
        let car = Car(yearOfIssue: "Foo", manufacture: "Bar", model: "Baz", bodyType: "Bat")
        XCTAssertEqual(car.yearOfIssue, "Foo")
        XCTAssertEqual(car.manufacture, "Bar")
        XCTAssertEqual(car.model, "Baz")
        XCTAssertEqual(car.bodyType, "Bat")
    }
}
