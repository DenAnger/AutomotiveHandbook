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
    var carListViewController: CarListViewController!
    
    override func setUpWithError() throws {
        dataSource = CarListDataSource()
        dataSource.carManager = CarManager()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        carListViewController = storyboard.instantiateViewController(
            identifier: "CarListViewController"
            ) as? CarListViewController
        carListViewController.loadViewIfNeeded()
        
        tableView = carListViewController.tableView
        tableView.dataSource = dataSource
    }

    override func tearDownWithError() throws {
        dataSource = nil
        tableView = nil
        carListViewController = nil
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
    
    func testCellForRowAtIndexPathReturnsCarCell() {
        dataSource.carManager?.add(car: Car(yearOfIssue: "Foo",
                                            manufacture: "Bar",
                                            model: "Baz",
                                            bodyType: "Bat"))
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is CarCell)
    }
    
    func testCellForRowDequeuesCellFromTableView() {
        let mockTableView = MockTableView()
        mockTableView.dataSource = dataSource
        mockTableView.register(CarCell.self, forCellReuseIdentifier: "cell")
        
        dataSource.carManager?.add(car: Car(yearOfIssue: "Foo",
                                            manufacture: "Bar",
                                            model: "Baz",
                                            bodyType: "Bat"))
        mockTableView.reloadData()
        
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssert(mockTableView.cellIsDequeued)
    }
    
    func testCellForRowCallsConfigureCell() {
        let mockTableView = MockTableView()
        mockTableView.dataSource = dataSource
        mockTableView.register(MockCarCell.self, forCellReuseIdentifier: "cell")
        
        let car = Car(yearOfIssue: "Foo",
                      manufacture: "Bar",
                      model: "Baz",
                      bodyType: "Bat")
        dataSource.carManager?.add(car: car)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(
            at: IndexPath(row: 0, section: 0)
            ) as! MockCarCell
        XCTAssertEqual(cell.car, car)
    }
}

extension CarListDataSourceTests {
    class MockTableView: UITableView {
        var cellIsDequeued = false
        
        override func dequeueReusableCell(
            withIdentifier identifier: String,
            for indexPath: IndexPath
        ) -> UITableViewCell {
            cellIsDequeued = true
            return super.dequeueReusableCell(withIdentifier: identifier,
                                             for: indexPath)
        }
    }
    
    class MockCarCell: CarCell {
        var car: Car?
        
        override func configure(with car: Car) {
            self.car = car
        }
    }
}
