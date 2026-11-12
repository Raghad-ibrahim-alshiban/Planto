//
//  PlantoName.swift
//  Planto
//
//  Created by raghad2003 on 02/06/1448 AH.
//

import Foundation
struct PlantoName : Identifiable {
     let id = UUID()
    var name :String
    var wateringDay : WateringDay
    var water : Water
    var room : Room
    var light : Light

    var isChecked: Bool = false
    
}
