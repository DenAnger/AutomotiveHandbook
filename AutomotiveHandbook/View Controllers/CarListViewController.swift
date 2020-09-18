//
//  CarListViewController.swift
//  AutomotiveHandbook
//
//  Created by Denis Abramov on 17.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import UIKit

class CarListViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataSource: CarListDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
    }
    
    
    @IBAction func addNewCar(_ sender: UIBarButtonItem) {
    }
}
