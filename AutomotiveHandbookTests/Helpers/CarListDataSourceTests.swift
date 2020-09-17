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

    var dataSource: CarListDataSource!
    var tableView: UITableView!
    
    override func setUpWithError() throws {
        dataSource = CarListDataSource()
        dataSource.carManager = CarManager()
        tableView = UITableView()
        tableView.dataSource = dataSource
    }

    override func tearDownWithError() throws {
        dataSource = nil
        tableView = nil
    }
    
    func testHasOneSection() {
        let numberOfSection = tableView.numberOfSections
        XCTAssertEqual(numberOfSection, 1)
    }
    
    func testNumberOfRowEqualsCarListCount() {
        dataSource.carManager?.add(car: Car(yearOfIssue: "Foo",
                                            manufacture: "Bar",
                                            model: "Baz",
                                            bodyType: "Bat"))
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        dataSource.carManager?.add(car: Car(yearOfIssue: "Bat",
                                            manufacture: "Baz",
                                            model: "Bar",
                                            bodyType: "Foo"))
        tableView.reloadData()
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
}
