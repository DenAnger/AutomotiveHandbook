//
//  DetailViewControllerTests.swift
//  AutomotiveHandbookTests
//
//  Created by Denis Abramov on 18.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import XCTest
@testable import AutomotiveHandbook

class DetailViewControllerTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testHasYearOfIssueLabel() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.yearOfIssueLabel)
    }
    
    func testHasManufactureLabel() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.manufactureLabel)
    }
    
    func testHasModelLabel() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.modelLabel)
    }
    
    func testHasBodyTypeLabel() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.bodyTypeLabel)
    }
}
