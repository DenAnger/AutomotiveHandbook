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
    
    var sut: CarListViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(
            identifier: "CarListViewController"
            ) as? CarListViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testWhenViewIsLoadedTableViewIsNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewIsLoadedCarListDataSourceIsNotNil() {
        XCTAssertNotNil(sut.dataSource)
    }
    
    func testWhenViewIsLoadedTableViewDataSourceIsSet() {
        XCTAssertTrue(sut.tableView.dataSource is CarListDataSource)
    }
    
    func testHasAddNewContactButton() {
        let target = sut.navigationItem.rightBarButtonItem?.target
        XCTAssertEqual(target as? CarListViewController, sut)
    }
    
    func testOpenNewCarViewController() {
        guard
            let addNewCarButton = sut.navigationItem.rightBarButtonItem,
            let action = addNewCarButton.action
            else {
                XCTFail()
                return
        }
        
        UIApplication.shared.windows.first?.rootViewController = sut
        sut.performSelector(onMainThread: action,
                            with: addNewCarButton,
                            waitUntilDone: true)
        XCTAssertNotNil(sut.presentedViewController)
        XCTAssertTrue(sut.presentedViewController is NewCarViewController)
    }
}
