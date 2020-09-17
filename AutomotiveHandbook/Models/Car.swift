//
//  Car.swift
//  AutomotiveHandbook
//
//  Created by Denis Abramov on 17.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import Foundation

struct Car {
    var yearOfIssue: String
    var manufacture: String
    var model: String
    var bodyType: String
    
    init(yearOfIssue: String, manufacture: String, model: String, bodyType: String) {
        self.yearOfIssue = yearOfIssue
        self.manufacture = manufacture
        self.model = model
        self.bodyType = bodyType
    }
}
