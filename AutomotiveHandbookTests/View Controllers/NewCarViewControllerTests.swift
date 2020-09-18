//
//  NewCarViewControllerTests.swift
//  AutomotiveHandbookTests
//
//  Created by Denis Abramov on 18.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import XCTest
@testable import AutomotiveHandbook

class NewCarViewControllerTests: XCTestCase {

    var sut: NewCarViewController!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(
            identifier: "NewCarViewController"
            ) as? NewCarViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testHasYearOfIssueTextField() {
        XCTAssertTrue(sut.yearOfIssueTextField.isDescendant(of: sut.view))
    }
    
    func testHasManufacturerTextField() {
        XCTAssertTrue(sut.manufacturerTextField.isDescendant(of: sut.view))
    }
    
    func testHasModelTextField() {
        XCTAssertTrue(sut.modelTextField.isDescendant(of: sut.view))
    }
    
    func testHasBodyTypeTextField() {
        XCTAssertTrue(sut.bodyTypeTextField.isDescendant(of: sut.view))
    }
    
    func testHasSaveButton() {
        XCTAssertTrue(sut.saveButton.isDescendant(of: sut.view))
    }
    
    func testHasCancelButton() {
        XCTAssertTrue(sut.cancelButton.isDescendant(of: sut.view))
    }
}
