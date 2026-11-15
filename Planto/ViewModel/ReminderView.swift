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
    
    @Published var editingPlantID : UUID? = nil

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
    
    var progressText :String {
        let completedCount = plants.filter{$0.isChecked}.count
        if completedCount == 0 {
            return "Your plants are waiting for a sip 💦"
        }else{
            return "\(completedCount) of your plants feel loved today✨"
        }
        
        
    }
    
    func startAdding() {
        editingPlantID = nil
        name = ""
        room = .bedr
        light = .full
        wateringDay = .evreyD
        water = .twn
        showingSheet = true
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
    
    func updatePlant() {
        if let id = editingPlantID,
           let index = plants.firstIndex(where: { $0.id == id }) {
            plants[index].name = name
            plants[index].room = room
            plants[index].light = light
            plants[index].wateringDay = wateringDay
            plants[index].water = water
        }
        editingPlantID = nil
        showingSheet = false
    }
    
    

    func deletePlant() {
        if let id = editingPlantID {
            plants.removeAll { $0.id == id }
        }
        editingPlantID = nil
        showingSheet = false
    }
  
    
}
