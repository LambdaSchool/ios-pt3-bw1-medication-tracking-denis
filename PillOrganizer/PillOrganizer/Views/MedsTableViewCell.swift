//
//  MedsTableViewCell.swift
//  PillOrganizer
//
//  Created by denis cedeno on 10/18/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import UIKit

class MedsTableViewCell: UITableViewCell {
    
    var meds: Medication? {
            didSet { setUpViews() }
    }
        
    @IBOutlet weak var medNameLabel: UILabel!
        
    private func setUpViews() {
        guard let medication = meds else {return}
            
        medNameLabel.text = medication.name
    }

}
