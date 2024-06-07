//
//  CarManager.swift
//  AutomotiveHandbook
//
//  Created by Denis Abramov on 17.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import Foundation

final class CarManager {
	var carsCount: Int {
		return cars.count
	}
	
	private var cars: [Car] = [
		Car(yearOfIssue: "2015",
			manufacturer: "Toyota",
			model: "Camry",
			bodyType: "Sedan"),
		Car(yearOfIssue: "2018",
			manufacturer: "Nissan",
			model: "Teana",
			bodyType: "Sedan"),
		Car(yearOfIssue: "2008",
			manufacturer: "Mitsubishi",
			model: "Pajero",
			bodyType: "Jeap")
	]
	
	func add(car: Car) {
		if !cars.contains(car) {
			cars.append(car)
		}
	}
	
	func car(at index: Int) -> Car {
		return cars[index]
	}
}
