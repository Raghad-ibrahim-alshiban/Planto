//
//  ReminderView.swift
//  Planto
//
//  Created by raghad2003 on 02/06/1448 AH.
//

import Foundation
import Combine
import UserNotifications

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
        if !plants.isEmpty && plants.allSatisfy({ $0.isChecked }) {
            plants.forEach { cancelNotification(for: $0) }
            plants.removeAll()
        }
        plants.append(newplant)
        scheduleNotification(for: newplant)
        showingSheet = false

    }
    
    func updatePlant() {
        if let id = editingPlantID,
           let index = plants.firstIndex(where: { $0.id == id }) {
            plants[index].name = name
            plants[index].room = room
            plants[index].light = light
            plants[index].wateringDay = wateringDay
            plants[index].water = water
            
            cancelNotification(for: plants[index])
            scheduleNotification(for: plants[index])
        }
        editingPlantID = nil
        showingSheet = false
    }
    
    

    func deletePlant() {
        if let id = editingPlantID {
            if let plant = plants.first(where: { $0.id == id }) {
                cancelNotification(for: plant)
            }
            plants.removeAll { $0.id == id }
        }
        editingPlantID = nil
        showingSheet = false
    }
    
    func startEditing(nameEdit: PlantoName) {
        editingPlantID = nameEdit.id
        name = nameEdit.name
        room = nameEdit.room
        light = nameEdit.light
        wateringDay = nameEdit.wateringDay
        water = nameEdit.water
        showingSheet = true
    }
    
    
    func removePlant(_ plant: PlantoName) {
        cancelNotification(for: plant)
        plants.removeAll { $0.id == plant.id }
    }
    
    func sortPlants() {
        plants = plants.filter { !$0.isChecked } + plants.filter { $0.isChecked }
    }
    

    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound]) { _, _ in }
    }

    func scheduleNotification(for plant: PlantoName) {
        let content = UNMutableNotificationContent()
        content.title = "Planto"
        content.body = "Hey! let's water your plant"
        content.sound = .default

        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: plant.wateringDay.intervalSeconds ,
            repeats: true
        )
        let request = UNNotificationRequest(
            identifier: plant.id.uuidString,
            content: content,
            trigger: trigger
        )
        UNUserNotificationCenter.current().add(request)
    }

    func cancelNotification(for plant: PlantoName) {
        UNUserNotificationCenter.current()
            .removePendingNotificationRequests(withIdentifiers: [plant.id.uuidString])
    }
    
}
