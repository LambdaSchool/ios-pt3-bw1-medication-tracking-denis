//
//  DailyMedsListTableViewController.swift
//  PillOrganizer
//
//  Created by denis cedeno on 10/17/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import UIKit

class DailyMedsListTableViewController: UITableViewController {
    
   var medController: MedsController? {
            didSet{
                updateViews()
            }
        }
        
        var day: String? {
            didSet{
                updateViews()
            }
        }
    
        var meds: [Medication] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            updateViews()
        }
        
        func updateViews() {
            guard isViewLoaded,
                let medController = medController,
                    let day = day else {return}
            
            meds = medController.medication(forDay: day)
            
            tableView.reloadData()
            title = day
        }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailViewSegue" {
            guard let vc = segue.destination as? DetailMedsViewController,
                let indexPath = tableView.indexPathForSelectedRow else {return}
            
            let med = meds[indexPath.row]
            vc.medication = med
            
        } else if segue.identifier == "addMedSegue" {
            guard let vc = segue.destination as? AddMedsViewController else { return }
            
            vc.delegate = self
        }
    }
    
        // MARK: - Table view data source
    
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
               return 100
        }
    
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return meds.count
        }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "medsCell", for: indexPath) as? MedsTableViewCell else {return UITableViewCell()}

            let med = meds[indexPath.row]
            cell.meds = med
            return cell
        }
    }

extension DailyMedsListTableViewController: AddMedDelegate {
func medWasAdded(_ med: Medication) {
    medController?.addMeds(med: med)
    tableView.reloadData()
    }
}
