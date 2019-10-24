//
//  DaysTableViewCell.swift
//  PillOrganizer
//
//  Created by denis cedeno on 10/18/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import UIKit

class DaysTableViewCell: UITableViewCell {

    var day: String? {
        didSet { setUpViews() }
    }
    var numberOfMedications: Int? {
        didSet { setUpViews() }
    }
    
    @IBOutlet weak var weekdayLabel: UILabel!
    @IBOutlet weak var numberOfMedsLabel: UILabel!
    
    private func setUpViews() {

        guard let day = day,
            let numberOfMedications = numberOfMedications else { return }
        
        weekdayLabel.text = day
        numberOfMedsLabel.text = "\(numberOfMedications) 💊"
    }

}
