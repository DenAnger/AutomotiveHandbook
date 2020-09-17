//
//  CarListDataSourceTests.swift
//  AutomotiveHandbookTests
//
//  Created by Denis Abramov on 17.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import XCTest
@testable import AutomotiveHandbook

class CarListDataSourceTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testHasOneSection() {
        let dataSource = CarListDataSource()
        let tableView = UITableView()
        tableView.dataSource = dataSource
        
        let numberOfSection = tableView.numberOfSections
        XCTAssertEqual(numberOfSection, 1)
    }
    
    func testNumberOfRowEqualsCarListCount() {
        let dataSource = CarListDataSource()
        let tableView = UITableView()
        tableView.dataSource = dataSource
        
        dataSource.carManager?.add(car: Car(yearOfIssue: "Foo",
                                            manufacture: "Bar",
                                            model: "Baz",
                                            bodyType: "Bat"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
    }
}
