//
//  CarListDataSource.swift
//  AutomotiveHandbook
//
//  Created by Denis Abramov on 17.09.2020.
//  Copyright © 2020 Denis Abramov. All rights reserved.
//

import UIKit

class CarListDataSource: NSObject {
    var carManager: CarManager?
}

// MARK: - UITableViewDataSource
extension CarListDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return carManager?.carsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell", for: indexPath
            ) as! CarCell
        return cell
    }
}
