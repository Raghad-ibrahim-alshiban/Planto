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
    
    var startDate: Date = Date()
    var lastCheckedDate: Date? = nil
    
    func isDueToday() -> Bool {
        let cal = Calendar.current
        let start = cal.startOfDay(for: startDate)
        let today = cal.startOfDay(for: Date())
        let daysPassed = cal.dateComponents([.day], from: start, to: today).day ?? 0
        return daysPassed % wateringDay.days == 0
    }
}
