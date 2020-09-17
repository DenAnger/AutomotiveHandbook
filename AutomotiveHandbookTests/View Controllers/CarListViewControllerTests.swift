//
//  CarListViewControllerTests.swift
//  AutomotiveHandbookTests
//
//  Created by Denis Abramov on 17.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import XCTest
@testable import AutomotiveHandbook

class CarListViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testWhenViewIsLoadedTableViewIsNotNil() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(identifier: "CarListViewController") as! CarListViewController
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewIsLoadedCarListDataSourceIsNotNil() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(identifier: "CarListViewController") as! CarListViewController
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.dataSource)
    }
}
