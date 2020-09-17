//
//  CarManager.swift
//  AutomotiveHandbook
//
//  Created by Denis Abramov on 17.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import Foundation

class CarManager {
    var carsCount = 0
    
    private var cars: [Car] = []
    
    func add(car: Car) {
        carsCount += 1
        cars.append(car)
    }
    
    func car(at index: Int) -> Car {
        return cars[index]
    }
}
