//
//  DaysOfTheWeekTableViewController.swift
//  PillOrganizer
//
//  Created by denis cedeno on 10/18/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import UIKit

class DaysOfTheWeekTableViewController: UITableViewController {

    let medsController: MedsController = MedsController()
    
    let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
        
    var meds: [Medication]?
        
    override func viewDidLoad() {
            super.viewDidLoad()
            updateViews()
    }
    
    func updateViews() {
        guard isViewLoaded else { return }
        tableView.reloadData()
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "MedListSegue" {
                guard let vc = segue.destination as? DailyMedsListTableViewController,
                    let indexPath = tableView.indexPathForSelectedRow else { return }
                
                let day = days[indexPath.row]
                vc.medController = medsController
                vc.day = day
                vc.daysOfTheWeekTVC = self

              } else if segue.identifier == "addMedSegue" {
                  guard let vc = segue.destination as? AddMedsViewController else { return }
                  
                vc.delegate = self
            }
        
    }

        // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: "weekdayCell", for: indexPath) as? DaysTableViewCell else { return UITableViewCell() }

               let day = days[indexPath.row]
               let numberOfMedications = medsController.medication(forDay: day).count
               cell.day = day
               cell.numberOfMedications = numberOfMedications
               return cell
    }
    
}

extension DaysOfTheWeekTableViewController: AddMedDelegate {
        func medWasAdded(_ med: Medication) {
            medsController.addMeds(med: med)
            tableView.reloadData()
        }
        
}
