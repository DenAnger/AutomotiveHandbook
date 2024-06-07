//
//  AutomotiveHandbookUITests.swift
//  AutomotiveHandbookUITests
//
//  Created by Denis Abramov on 17.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import XCTest

class AutomotiveHandbookUITests: XCTestCase {
	
	override func setUpWithError() throws {
		continueAfterFailure = false
	}
	
	func testExample() throws {
		let app = XCUIApplication()
		app.launch()
	}
	
	func testLaunchPerformance() throws {
		if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
			measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
				XCUIApplication().launch()
			}
		}
	}
}
