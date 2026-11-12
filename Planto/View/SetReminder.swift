//
//  SetReminder.swift
//  Planto
//
//  Created by raghad2003 on 29/05/1448 AH.
//

import SwiftUI

struct SetReminder: View {

    @StateObject var serReminder = ReminderView()
    var body: some View {
        
        
        
        
        NavigationStack{
            Divider()
                    .background {Color.gray.opacity(0.3)}
          
                ZStack(alignment: .center){
                    
                    if serReminder.plants.isEmpty{
                        Text("No reminders set yet.. ")
                            .font(.system(size: 20 ,weight:.regular))
                            .foregroundStyle(.grayText)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                    }
                    //MARK: - Card_Plant

                    else{
                        ScrollView{
                            VStack(spacing:16){
                                VStack(alignment:.center, spacing: 8) {
                                    Text("Your plants are waiting for a sip 💦") // أو أي كلام تبينه يظهر فوق
                                        .font(.system(size: 20, weight: .semibold ))
                                        .foregroundStyle(.white)
                                        .multilineTextAlignment(.center)
                                    
                                    ProgressView(value: serReminder.progress)
                                        .tint(.green)
                                }
                                .padding(.horizontal)
                                .padding(.top, 8)
                                
                                VStack(spacing:12) {
                                  
                                    ForEach($serReminder.plants){$plant in
                                      
                                        HStack {
                                            Button{
                                                plant.isChecked.toggle()
                                            }label: {
                                                Image(systemName: plant.isChecked ? "checkmark.circle.fill" : "circle")
                                                    .font(.system(size: 30))
                                                    .foregroundStyle(plant.isChecked ? .green : .gray)
                                            }
                                            VStack(alignment: .leading ,spacing: 8){
                                                HStack{
                                                    Image(systemName: "location")
                                                    Text("in \(plant.room.rawValue) ")}
                                                
                                                Text(plant.name)
                                                    .font(.system(size: 20 ,weight:.semibold))
                                                HStack(spacing: 24){
                                                    HStack (spacing:18){
                                                        Image(systemName: "sun.max.fill")
                                                            .font(.system(size: 14))
                                                        Text(plant.light.rawValue)
                                                            .font(.system(size: 12 ,weight: .medium))
                                                    }
                                                    .padding(.horizontal ,8)
                                                    .padding(.vertical ,4)
                                                    .background(Color.gray.opacity(0.2))
                                                    .clipShape(Capsule())
//                                                    .foregroundStyle(.orange)
//                                                    .cornerRadius(8)
                                                    HStack (spacing:18){
                                                        Image(systemName: "drop.fill")
                                                            .font(.system(size: 14))
                                                        Text(plant.water.rawValue)
                                                            .font(.system(size: 12 ,weight: .medium))
                                                    }
                                                    .padding(.horizontal ,8)
                                                    .padding(.vertical ,4)
                                                    .background(Color.gray.opacity(0.2))
                                                    .clipShape(Capsule())
                                                    .foregroundStyle(.blue)
                                                    .cornerRadius(8)
                                                    
                                                }
                                                
                                            }
                                            .padding()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .background(Color.black)
                                            .clipShape(RoundedRectangle(cornerRadius: 16))
                                            .opacity(plant.isChecked ? 0.4 : 1.0)

                                        }
                                        Divider()
                                                .background {Color.gray.opacity(0.3)}
                                    }
                                    .padding(.horizontal)
                                }
                            }.background(Color.black)
                        }
                    }
                
                    //MARK: - plus

                Button{
                    serReminder.showingSheet = true
                }
                label:{
                   
                        Image(systemName: "plus")
                        .font(.system(size: 24 , weight: .semibold))
                            .frame(width: 30,height: 35)

                           }
                .buttonStyle(.glassProminent)
                .buttonBorderShape(.circle)
                .tint(Color.button)
                .padding(.trailing,20)
                .padding(.bottom,12)
           
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment:.bottomTrailing)
                    
                }
            
            
            
            
            .navigationTitle("My Plants 🌱")
            
            .navigationBarBackButtonHidden(true)
            
            //MARK: - Sheet
            
            .sheet(isPresented: $serReminder.showingSheet){
                NavigationStack {
                    Form {
                        HStack{
                            Text("Plant Name")
                            TextField("", text: $serReminder.name , prompt: Text("Pothos") )

                        }
                        
                        Section{
                            Picker(selection: $serReminder.room){
                                ForEach(Room.allCases){ item in Text(item.rawValue).tag(item)
                                    
                                }

                            }
                            label:{
                                Label("Room", systemImage:"location")
                                    .foregroundStyle(.white)
                            }
                            Picker(selection: $serReminder.light){
                                ForEach(Light.allCases){ item in Text(item.rawValue).tag(item)
                                    
                                }

                            }
                            label:{
                                Label("Light", systemImage:"sun.max")
                                    .foregroundStyle(.white)
                            }
                        }
                        Section{
                            Picker(selection: $serReminder.wateringDay){
                                ForEach(WateringDay.allCases){ item in Text(item.rawValue).tag(item)
                                    
                                }

                            }
                            label:{
                                Label("Watering Days", systemImage:"drop")
                                    .foregroundStyle(.white)
                            }
                            Picker(selection: $serReminder.water){
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
                                serReminder.showingSheet = false
                            }label: {
                                Image(systemName : "xmark")
                            }
                        }
                        
                        ToolbarItem(placement: .confirmationAction) {
                            Button {
                                serReminder.addPlant()
                            } label: {
                                Image(systemName:"checkmark")
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(Color.button)
                        }
                        
                    }
                }
                
                
                
            }
            
            
        }
    }
}
#Preview {
    SetReminder()
}
