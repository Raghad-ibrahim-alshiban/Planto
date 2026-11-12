//
//  ReminderView.swift
//  Planto
//
//  Created by raghad2003 on 02/06/1448 AH.
//

import Foundation
import Combine
class ReminderView : ObservableObject {
    @Published var showingSheet : Bool = false
    

    @Published var name: String = ""
    @Published var room :Room = .bedr
    @Published var light:Light = .full
    @Published var wateringDay : WateringDay = .evreyD
    @Published var water : Water = .twn
   
    @Published var plants :[PlantoName] = []
    
    var progress: Double {
        let completedCount = plants.filter { $0.isChecked }.count
        let totalCount = plants.count
        return totalCount > 0 ? Double(completedCount) / Double(totalCount) : 0.0
    }
    
    
    func addPlant(){
        let newplant = PlantoName(name: name, wateringDay: wateringDay, water: water, room: room, light: light)
        plants.append(newplant)
        showingSheet = false
        name = ""
        room = .bedr
        light = .full
        wateringDay = .evreyD
        water = .twn
    }
    
    
}
