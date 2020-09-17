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
    var car: Car!

    override func setUpWithError() throws {
        carManager = CarManager()
        car = Car(yearOfIssue: "Foo",
                  manufacture: "Bar",
                  model: "Baz",
                  bodyType: "Bat")
    }

    override func tearDownWithError() throws {
        carManager = nil
        car = nil
    }
    
    func testInitCarManagerWithEmptyList() {
        XCTAssertEqual(carManager.carsCount, 0)
    }
    
    func testAddCarIncrementCarListCount() {
        carManager.add(car: car)
        XCTAssertEqual(carManager.carsCount, 1)
    }
    
    func testCarAtIndexIsAddedCar() {
        carManager.add(car: car)
        let returnedCar = carManager.car(at: 0)
        XCTAssertEqual(car.yearOfIssue, returnedCar.yearOfIssue)
    }
    
    func testAddingSameObjectDoesNotIncrementCount() {
        carManager.add(car: Car(yearOfIssue: "Foo",
                                manufacture: "Bar",
                                model: "Baz",
                                bodyType: "Bat"))
        carManager.add(car: Car(yearOfIssue: "Foo",
                                manufacture: "Bar",
                                model: "Baz",
                                bodyType: "Bat"))
        XCTAssertEqual(carManager.carsCount, 1)
    }
}
