//
//  WeeklyMedsViewController.swift
//  PillOrganizer
//
//  Created by denis cedeno on 10/16/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import UIKit

class WeeklyMedsViewController: UIViewController {
    let medsController: MedsController = MedsController()
    
    let days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}

extension WeeklyMedsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "weekdayCell", for: indexPath) as? DailyMedsViewCell else { return UITableViewCell() }

        let day = days[indexPath.row]
        let numberOfMedications = medsController.medication(forDay: day).count
        cell.day = day
        cell.numberOfMedications = numberOfMedications
        return cell
    }
    
    
}

