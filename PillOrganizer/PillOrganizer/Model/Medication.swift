//
//  meds.swift
//  PillOrganizer
//
//  Created by denis cedeno on 10/16/19.
//  Copyright © 2019 DenCedeno Co. All rights reserved.
//

import Foundation

struct Medication: Codable {
    var name: String?
    var notes: String?
    
    var day: String?
    var takeDaily: Bool = false
}

