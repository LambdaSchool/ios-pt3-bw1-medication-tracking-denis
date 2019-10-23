//
//  MedsController.swift
//  PillOrganizer
//
//  Created by denis cedeno on 10/16/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import Foundation

class MedsController {
    
    private (set) var meds: [Medication] = []
    
       init(){
           loadFromPersistentStore()
       }

       func addMeds(med: Medication) {
           meds.append(med)
           saveToPersistentStore()
       }
       
       func deleteMedsList(){
           meds = []
           saveToPersistentStore()
       }
    
    func medication(forDay day: String) -> [Medication] {
        return meds.filter { (medication) -> Bool in
            return medication.day == day
        }
    }
    
}


extension MedsController {
    
    private var persistentFileURL: URL? {
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let fileName = "MedicationList2.plist"
        
        return dir?.appendingPathComponent(fileName)
        
    }
    
    
    private func loadFromPersistentStore(){
        do{
            guard let url = persistentFileURL else { return }
            let medsData = try Data(contentsOf: url)
            self.meds = try PropertyListDecoder().decode([Medication].self, from: medsData)
        } catch{
            NSLog("error with data: \(error)")
        }
    }
    
    
    
    private func saveToPersistentStore(){
        let medslistEncoder = PropertyListEncoder()
        do{
            let data = try medslistEncoder.encode(meds)
            guard let url = persistentFileURL else {return}
            try data.write(to: url)
        } catch{
            NSLog("error saving to plist or writing data: \(error)")
        }
    }
    
    
    
}
