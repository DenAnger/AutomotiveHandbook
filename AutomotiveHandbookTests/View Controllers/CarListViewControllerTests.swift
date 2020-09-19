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
    
    func testTappingCellSendsNotification() {
        let car = Car(yearOfIssue: "2015",
                      manufacturer: "Toyota",
                      model: "Camry",
                      bodyType: "Sedan")
        sut.dataSource.carManager?.add(car: car)
        
        expectation(
            forNotification: NSNotification.Name(
                rawValue: "DidSelectRow notification"),
            object: nil
        ) { notification -> Bool in
            guard let carFromNotification = notification.userInfo?["car"] as? Car
                else { return false }
            return car == carFromNotification
        }
        
        let tableView = sut.tableView
        tableView?.delegate?.tableView!(tableView!,
                                        didSelectRowAt: IndexPath(row: 0,
                                                                  section: 0))
        waitForExpectations(timeout: 1)
    }
    
    func testSelectedCellHasShownDetailViewController() {
        let mockNavigationController = MockNavigationController(rootViewController: sut)
        UIApplication.shared.windows.first?.rootViewController = mockNavigationController
        
        sut.loadViewIfNeeded()
        
        let carOne = Car(yearOfIssue: "Foo",
                         manufacturer: "Bar",
                         model: "Baz",
                         bodyType: "Bat")
        let carTwo = Car(yearOfIssue: "Bat",
                         manufacturer: "Baz",
                         model: "Bar",
                         bodyType: "Foo")
        
        sut.dataSource.carManager?.add(car: carOne)
        sut.dataSource.carManager?.add(car: carTwo)
        
        NotificationCenter.default.post(
            name: NSNotification.Name(rawValue: "DidSelectRow notification"),
            object: self,
            userInfo: ["car": carTwo]
        )
        
        guard let detailViewController = mockNavigationController.pushedViewController as? DetailViewController
            else {
                XCTFail()
                return
        }
        detailViewController.loadViewIfNeeded()
        XCTAssertNotNil(detailViewController.yearOfIssueLabel)
        XCTAssertTrue(detailViewController.car == carTwo)
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
    
    class MockNavigationController: UINavigationController {
        var pushedViewController: UIViewController?
        
        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            pushedViewController = viewController
            super.pushViewController(viewController, animated: animated)
        }
    }
}
