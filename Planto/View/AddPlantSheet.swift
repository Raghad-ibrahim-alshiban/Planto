//
//  AddPlantSheet.swift
//  Planto
//
//  Created by raghad2003 on 04/06/1448 AH.
//

import SwiftUI

struct AddPlantSheet: View {
    @ObservedObject var Sheet = ReminderView()
    var body: some View {
        NavigationStack{
            Form {
                HStack{
                    Text("Plant Name")
                    TextField("", text: $Sheet.name , prompt: Text("Pothos") )

                }
                
                Section{
                    Picker(selection: $Sheet.room){
                        ForEach(Room.allCases){ item in Text(item.rawValue).tag(item)
                            
                        }

                    }
                    label:{
                        Label("Room", systemImage:"location")
                            .foregroundStyle(.white)
                    }
                    Picker(selection: $Sheet.light){
                        ForEach(Light.allCases){ item in Text(item.rawValue).tag(item)
                            
                        }

                    }
                    label:{
                        Label("Light", systemImage:"sun.max")
                            .foregroundStyle(.white)
                    }
                }
                Section{
                    Picker(selection: $Sheet.wateringDay){
                        ForEach(WateringDay.allCases){ item in Text(item.rawValue).tag(item)
                            
                        }

                    }
                    label:{
                        Label("Watering Days", systemImage:"drop")
                            .foregroundStyle(.white)
                    }
                    Picker(selection: $Sheet.water){
                        ForEach(Water.allCases){ item in Text(item.rawValue).tag(item)
                            
                        }

                    }
                    label:{
                        Label("Water", systemImage:"drop")
                            .foregroundStyle(.white)
                    }
                }
              
                
            }
            .navigationTitle("Set Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        Sheet.showingSheet = false
                    }label: {
                        Image(systemName : "xmark")
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        Sheet.addPlant()
                    } label: {
                        Image(systemName:"checkmark")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.button)
                }
                
            }
        }    }
}

#Preview {
    AddPlantSheet()
}
