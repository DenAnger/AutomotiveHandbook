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
    
    var carManager: CarManager!

    override func setUpWithError() throws {
        carManager = CarManager()
    }

    override func tearDownWithError() throws {
        carManager = nil
    }
    
    func testInitCarManagerWithEmptyList() {
        XCTAssertEqual(carManager.carsCount, 0)
    }
    
    func testAddCarIncrementCarListCount() {
        let car = Car(yearOfIssue: "Foo",
                      manufacture: "Bar",
                      model: "Baz",
                      bodyType: "Bat")
        carManager.add(car: car)
        XCTAssertEqual(carManager.carsCount, 1)
    }
    
    func testCarAtIndexIsAddedCar() {
        let car = Car(yearOfIssue: "Foo",
                      manufacture: "Bar",
                      model: "Baz",
                      bodyType: "Bat")
        carManager.add(car: car)
        let returnedCar = carManager.car(at: 0)
        XCTAssertEqual(car.yearOfIssue, returnedCar.yearOfIssue)
    }
}
