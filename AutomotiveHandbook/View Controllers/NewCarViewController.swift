//
//  NewCarViewController.swift
//  AutomotiveHandbook
//
//  Created by Denis Abramov on 18.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import UIKit

class NewCarViewController: UIViewController {
    
    @IBOutlet var yearOfIssueTextField: UITextField!
    @IBOutlet var manufacturerTextField: UITextField!
    @IBOutlet var modelTextField: UITextField!
    @IBOutlet var bodyTypeTextField: UITextField!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
    var carManager: CarManager!
    
    @IBAction func saveButtonPressed() {
        let yearOfIssue = yearOfIssueTextField.text
        let manufacturer = manufacturerTextField.text
        let model = modelTextField.text
        let bodyType = bodyTypeTextField.text
        
        let car = Car(yearOfIssue: yearOfIssue ?? "",
                      manufacturer: manufacturer ?? "",
                      model: model ?? "",
                      bodyType: bodyType ?? "")
        carManager.add(car: car)
        dismiss(animated: true)
    }
    
    @IBAction func cancelButtonPressed() {
        dismiss(animated: true)
    }
}
