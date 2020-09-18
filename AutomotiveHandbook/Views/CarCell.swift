//
//  CarCell.swift
//  AutomotiveHandbook
//
//  Created by Denis Abramov on 18.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import UIKit

class CarCell: UITableViewCell {
    
    @IBOutlet var modelLabel: UILabel!
    
    func configure(with car: Car) {
        modelLabel.text = car.model
    }
}
