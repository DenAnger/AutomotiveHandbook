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
    
    func testHasManufactureLabel() {
        XCTAssertNotNil(sut.manufactureLabel)
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
    
    func testHasManufactureLabelInView() {
        XCTAssertTrue(sut.manufactureLabel.isDescendant(of: sut.view))
    }
    
    func testHasModelLabelInView() {
        XCTAssertTrue(sut.modelLabel.isDescendant(of: sut.view))
    }
    
    func testHasBodyTypeLabelInView() {
        XCTAssertTrue(sut.bodyTypeLabel.isDescendant(of: sut.view))
    }
    
    func testSetValueToYearOfIssueLabel() {
        let car = Car(yearOfIssue: "Foo",
                      manufacture: "Bar",
                      model: "Baz",
                      bodyType: "Bat")
        sut.car = car
        
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
        XCTAssertEqual(sut.yearOfIssueLabel.text, "Foo")
    }
    
    func testSetValueToManufactureLabel() {
        let car = Car(yearOfIssue: "Foo",
                      manufacture: "Bar",
                      model: "Baz",
                      bodyType: "Bat")
        sut.car = car
        
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
        XCTAssertEqual(sut.manufactureLabel.text, "Bar")
    }
    
    func testSetValueToModelLabel() {
        let car = Car(yearOfIssue: "Foo",
                      manufacture: "Bar",
                      model: "Baz",
                      bodyType: "Bat")
        sut.car = car
        
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
        XCTAssertEqual(sut.modelLabel.text, "Baz")
    }
    
    func testSetValueToBodyTypeLabel() {
        let car = Car(yearOfIssue: "Foo",
                      manufacture: "Bar",
                      model: "Baz",
                      bodyType: "Bat")
        sut.car = car
        
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
        XCTAssertEqual(sut.bodyTypeLabel.text, "Bat")
    }
}
