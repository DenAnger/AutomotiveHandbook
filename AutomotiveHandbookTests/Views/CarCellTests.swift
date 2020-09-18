//
//  CarCellTests.swift
//  AutomotiveHandbookTests
//
//  Created by Denis Abramov on 18.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import XCTest
@testable import AutomotiveHandbook

class CarCellTests: XCTestCase {
    
    var cell: CarCell!

    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboard.instantiateViewController(
            identifier: "CarListViewController"
            ) as! CarListViewController
        sut.loadViewIfNeeded()
        
        let tableView = sut.tableView
        let dataSource = MockTableViewDataSource()
        tableView?.dataSource = dataSource
        
        cell = tableView?.dequeueReusableCell(
            withIdentifier: "cell", for: IndexPath(row: 0, section: 0)
            ) as? CarCell
    }

    override func tearDownWithError() throws {
        cell = nil
    }

    func testCellHasModelLabel() {
        XCTAssertNotNil(cell.modelLabel)
    }
    
    func testCellHasModelNameLabelInContentView() {
        XCTAssertTrue(cell.modelLabel.isDescendant(of: cell.contentView))
    }
}

extension CarCellTests {
    class MockTableViewDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView,
                       numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView,
                       cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
    }
}
