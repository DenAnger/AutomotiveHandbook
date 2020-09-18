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
    
    func testSaveNewCar() {
        sut.yearOfIssueTextField.text = "Foo"
        sut.manufacturerTextField.text = "Bar"
        sut.modelTextField.text = "Baz"
        sut.bodyTypeTextField.text = "Bat"
        
        sut.carManager = CarManager()
        sut.saveButtonPressed()
        
        let auto = sut.carManager.car(at: 0)
        let car = Car(yearOfIssue: "Foo",
                      manufacturer: "Bar",
                      model: "Baz",
                      bodyType: "Bat")
        XCTAssertEqual(auto, car)
    }
    
    func testSaveButtonHasSaveMethod() {
        let saveButton = sut.saveButton
        guard let actions = saveButton?.actions(forTarget: sut,
                                                forControlEvent: .touchUpInside)
            else {
            XCTFail()
            return
        }
        XCTAssertTrue(actions.contains("saveButtonPressed"))
    }
    
    func testSaveDismissesNewCarViewController() {
        let mockNewCarViewController = MockNewCarViewController()
        mockNewCarViewController.yearOfIssueTextField = UITextField()
        mockNewCarViewController.yearOfIssueTextField.text = "Foo"
        mockNewCarViewController.manufacturerTextField = UITextField()
        mockNewCarViewController.manufacturerTextField.text = "Bar"
        mockNewCarViewController.modelTextField = UITextField()
        mockNewCarViewController.modelTextField.text = "Baz"
        mockNewCarViewController.bodyTypeTextField = UITextField()
        mockNewCarViewController.bodyTypeTextField.text = "Bat"
        
        mockNewCarViewController.carManager = CarManager()
        mockNewCarViewController.saveButtonPressed()
        XCTAssertTrue(mockNewCarViewController.isDismiss)
    }
}

extension NewCarViewControllerTests {
    class MockNewCarViewController: NewCarViewController {
        var isDismiss = false
        
        override func dismiss(animated flag: Bool,
                              completion: (() -> Void)? = nil) {
            isDismiss = true
        }
    }
}
