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
//                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                }
                //MARK: - All_Done
                else{
                    
                    
                    if serReminder.plants.filter({ $0.isChecked }).count == serReminder.plants.count{
                        VStack(alignment: .center
                               , spacing:23)
                        {
                            Image(.doneAll)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.top, 45)
                            Text("All Done! 🎉")
                                .font(.system(size: 25 , weight: .semibold))

                            Text("All Reminders Completed")
                                .font(.system(size: 16 , weight: .semibold , ))
                                .foregroundStyle(.grayText)
                                .multilineTextAlignment(.center)
                            
                       
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    
                
                    //MARK: - Progress
                else{
                    List{
                        
                            VStack(alignment:.center, spacing: 8) {
                                Text(serReminder.progressText)
                                    .font(.system(size: 18, weight: .regular ))
                                    .foregroundStyle(.white)
                                    .multilineTextAlignment(.center)
                                
                                ProgressView(value: serReminder.progress)
                                    .tint(.green)
                            }
                            .padding(.horizontal)
                            .padding(.top, 8)
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            //MARK: - Card_Plant

                      
                                
                                ForEach($serReminder.plants){$plant in
                                    PlantCard(plant: $plant)
                                        .onTapGesture {
                                            serReminder.startEditing(nameEdit: plant)                                               }
                                  
                                        .listRowBackground(Color.clear)
                                        .listRowSeparatorTint(Color.gray.opacity(0.3))
                                        .swipeActions(edge:.trailing,allowsFullSwipe:true) {
                                            Button(role: .destructive) {
                                  serReminder.removePlant(plant)
                                        } label: {
                                              Image(systemName: "trash")
                                                        }
                                                    }
                                }
                        
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                }
                }
                
                    //MARK: - plus

                Button{
                    serReminder.startAdding()                }
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
            .onAppear {
                serReminder.requestNotificationPermission()
            }
            
            //MARK: - Sheet
            
            .sheet(isPresented: $serReminder.showingSheet){
                
                AddPlantSheet(Sheet: serReminder)
                
            }
            
            
        }
    }
}
#Preview {
    SetReminder()
}
