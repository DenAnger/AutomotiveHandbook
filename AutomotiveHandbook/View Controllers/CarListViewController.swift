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
        tableView.delegate = dataSource
        
        let carManager = CarManager()
        dataSource.carManager = carManager
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    @IBAction func addNewCar(_ sender: UIBarButtonItem) {
        
        if let newCarViewController = storyboard?.instantiateViewController(identifier: "NewCarViewController") as? NewCarViewController {
            newCarViewController.modalPresentationStyle = .fullScreen
            newCarViewController.carManager = dataSource.carManager
            present(newCarViewController, animated: true)
        }
    }
}
