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
        let newCarViewController = presentingNewCarViewController()
        XCTAssertNotNil(newCarViewController.yearOfIssueTextField)
    }
    
    func testSharesSameCarManagerWithNewCarViewController () {
        let newCarViewController = presentingNewCarViewController()
        XCTAssertNotNil(sut.dataSource.carManager)
        XCTAssertTrue(newCarViewController.carManager === sut.dataSource.carManager)
    }
    
    func testWhenViewAppearedTableViewReloaded() {
        let mockTableView = MockTableView()
        sut.tableView = mockTableView
        
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
        XCTAssertTrue((sut.tableView as! MockTableView).isReloaded)
    }
    
    func presentingNewCarViewController() -> NewCarViewController {
        guard
        let addNewCarButton = sut.navigationItem.rightBarButtonItem,
        let action = addNewCarButton.action
            else {
                return NewCarViewController()
        }
        
        UIApplication.shared.windows.first?.rootViewController = sut
        sut.performSelector(onMainThread: action,
                            with: addNewCarButton,
                            waitUntilDone: true)
        let newCarViewController = sut.presentedViewController as! NewCarViewController
        return newCarViewController
    }
}

extension CarListViewControllerTests {
    class MockTableView: UITableView {
        var isReloaded = false
        override func reloadData() {
            isReloaded = true
        }
    }
}
