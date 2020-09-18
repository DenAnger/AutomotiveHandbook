//
//  Car.swift
//  AutomotiveHandbook
//
//  Created by Denis Abramov on 17.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import Foundation

struct Car: Equatable {
    var yearOfIssue: String
    var manufacturer: String
    var model: String
    var bodyType: String
    
    init(yearOfIssue: String,
         manufacturer: String,
         model: String,
         bodyType: String) {
        self.yearOfIssue = yearOfIssue
        self.manufacturer = manufacturer
        self.model = model
        self.bodyType = bodyType
    }
}
