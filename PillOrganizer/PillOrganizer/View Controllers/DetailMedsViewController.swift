//
//  DetailMedsViewController.swift
//  PillOrganizer
//
//  Created by denis cedeno on 10/16/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import UIKit

class DetailMedsViewController: UIViewController {

    @IBOutlet weak var medicationNameLabel: UILabel!
    @IBOutlet weak var medicationNotesTextView: UITextView!
    
    var medication: Medication?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    private func updateViews() {
        guard let medication = medication else { return }
        print("\(medication)")
        medicationNameLabel.text = medication.name
        medicationNotesTextView.text = medication.notes
    }

}
