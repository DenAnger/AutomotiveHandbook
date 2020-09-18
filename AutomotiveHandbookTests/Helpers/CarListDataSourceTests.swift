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
    var mockTableView: MockTableView!
    var carListViewController: CarListViewController!
    var car: Car!
    
    override func setUpWithError() throws {
        dataSource = CarListDataSource()
        dataSource.carManager = CarManager()
        
        mockTableView = MockTableView.mockTableView(withDataSource: dataSource)
        car = Car(yearOfIssue: "Foo",
                  manufacturer: "Bar",
                  model: "Baz",
                  bodyType: "Bat")
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        carListViewController = storyboard.instantiateViewController(
            identifier: "CarListViewController"
            ) as? CarListViewController
        carListViewController.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        dataSource = nil
        mockTableView = nil
        carListViewController = nil
        car = nil
    }
    
    func testHasOneSection() {
        let numberOfSection = mockTableView.numberOfSections
        XCTAssertEqual(numberOfSection, 1)
    }
    
    func testNumberOfRowEqualsCarListCount() {
        dataSource.carManager?.add(car: car)
        XCTAssertEqual(mockTableView.numberOfRows(inSection: 0), 1)
        
        dataSource.carManager?.add(car: Car(yearOfIssue: "Bat",
                                            manufacturer: "Baz",
                                            model: "Bar",
                                            bodyType: "Foo"))
        mockTableView.reloadData()
        XCTAssertEqual(mockTableView.numberOfRows(inSection: 0), 2)
    }
    
    func testCellForRowAtIndexPathReturnsCarCell() {
        dataSource.carManager?.add(car: car)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(cell is CarCell)
    }
    
    func testCellForRowDequeuesCellFromTableView() {
        dataSource.carManager?.add(car: car)
        mockTableView.reloadData()
        
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssert(mockTableView.cellIsDequeued)
    }
    
    func testCellForRowCallsConfigureCell() {
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
        
        static func mockTableView(
            withDataSource dataSource: UITableViewDataSource
        ) -> MockTableView {
            let mockTableView = MockTableView()
            mockTableView.dataSource = dataSource
            mockTableView.register(MockCarCell.self,
                                   forCellReuseIdentifier: "cell")
            return mockTableView
        }
    }
    
    class MockCarCell: CarCell {
        var car: Car?
        
        override func configure(with car: Car) {
            self.car = car
        }
    }
}
