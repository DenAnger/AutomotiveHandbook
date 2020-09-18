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
    
    var sut: DetailViewController!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testHasYearOfIssueLabel() {
        XCTAssertNotNil(sut.yearOfIssueLabel)
    }
    
    func testHasManufactureLabel() {
        XCTAssertNotNil(sut.manufactureLabel)
    }
    
    func testHasModelLabel() {
        XCTAssertNotNil(sut.modelLabel)
    }
    
    func testHasBodyTypeLabel() {
        XCTAssertNotNil(sut.bodyTypeLabel)
    }
}
