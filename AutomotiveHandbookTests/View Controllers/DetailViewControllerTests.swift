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
        sut = storyboard.instantiateViewController(
            identifier: "DetailViewController"
            ) as? DetailViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testHasYearOfIssueLabel() {
        XCTAssertNotNil(sut.yearOfIssueLabel)
    }
    
    func testHasManufacturerLabel() {
        XCTAssertNotNil(sut.manufacturerLabel)
    }
    
    func testHasModelLabel() {
        XCTAssertNotNil(sut.modelLabel)
    }
    
    func testHasBodyTypeLabel() {
        XCTAssertNotNil(sut.bodyTypeLabel)
    }
    
    func testHasYearOfIssueLabelInView() {
        XCTAssertTrue(sut.yearOfIssueLabel.isDescendant(of: sut.view))
    }
    
    func testHasManufacturerLabelInView() {
        XCTAssertTrue(sut.manufacturerLabel.isDescendant(of: sut.view))
    }
    
    func testHasModelLabelInView() {
        XCTAssertTrue(sut.modelLabel.isDescendant(of: sut.view))
    }
    
    func testHasBodyTypeLabelInView() {
        XCTAssertTrue(sut.bodyTypeLabel.isDescendant(of: sut.view))
    }
    
    func testSetValueToYearOfIssueLabel() {
        setupCarAndAppearanceTransition()
        XCTAssertEqual(sut.yearOfIssueLabel.text, "Foo")
    }
    
    func testSetValueToManufacturerLabel() {
        setupCarAndAppearanceTransition()
        XCTAssertEqual(sut.manufacturerLabel.text, "Bar")
    }
    
    func testSetValueToModelLabel() {
        setupCarAndAppearanceTransition()
        XCTAssertEqual(sut.modelLabel.text, "Baz")
    }
    
    func testSetValueToBodyTypeLabel() {
        setupCarAndAppearanceTransition()
        XCTAssertEqual(sut.bodyTypeLabel.text, "Bat")
    }
    
    func setupCarAndAppearanceTransition() {
        let car = Car(yearOfIssue: "Foo",
                      manufacturer: "Bar",
                      model: "Baz",
                      bodyType: "Bat")
        sut.car = car
        
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
    }
}
