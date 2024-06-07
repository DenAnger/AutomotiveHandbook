//
//  DetailViewController.swift
//  AutomotiveHandbook
//
//  Created by Denis Abramov on 18.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController {
	@IBOutlet var yearOfIssueLabel: UILabel!
	@IBOutlet var manufacturerLabel: UILabel!
	@IBOutlet var modelLabel: UILabel!
	@IBOutlet var bodyTypeLabel: UILabel!
	
	var car: Car!
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		yearOfIssueLabel.text = car.yearOfIssue
		manufacturerLabel.text = car.manufacturer
		modelLabel.text = car.model
		bodyTypeLabel.text = car.bodyType
	}
}
