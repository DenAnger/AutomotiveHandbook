//
//  CarManagerTests.swift
//  AutomotiveHandbookTests
//
//  Created by Denis Abramov on 17.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import XCTest
@testable import AutomotiveHandbook

class CarManagerTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testInitCarManagerWithEmptyList() {
        let carManager = CarManager()
        XCTAssertEqual(carManager.carsCount, 0)
    }

}
