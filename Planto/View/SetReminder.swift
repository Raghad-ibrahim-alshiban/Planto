//
//  SetReminder.swift
//  Planto
//
//  Created by raghad2003 on 29/05/1448 AH.
//

import SwiftUI

struct SetReminder: View {

    @ObservedObject var serReminder: ReminderView
    
//    @AppStorage("openSheetOnStart") var openSheetOnStart: Bool = false
    var body: some View {
        
        
        
        
        NavigationStack{
            Divider()
                    .background {Color.gray.opacity(0.3)}
          
            ZStack(alignment: .center){
                
                if serReminder.plants.isEmpty{
                    Text("No reminders set yet.. ")
                        .font(.system(size: 20 ,weight:.regular))
                        .foregroundStyle(.grayText)
                    
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
                        
                            VStack(alignment:.center, spacing: 12) {
                                Text(serReminder.progressText)
                                    .font(.system(size: 18, weight: .regular ))
                                    .foregroundStyle(.white)
                                    .multilineTextAlignment(.center)
                                
                                ProgressView(value: serReminder.progress)
                                    .progressViewStyle(PlantProgressStyle())
                                    .animation(.easeInOut, value: serReminder.progress)
                            }
                            .padding(.top, 8)
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                         
                            //MARK: - Card_Plant

                      
                                
                                ForEach($serReminder.plants){$plant in
                                    PlantCard(plant: $plant)
                                        .padding(.horizontal)
                                        .onTapGesture {
                                            serReminder.startEditing(nameEdit: plant)                                               }
                                  
                                        .listRowBackground(Color.clear)
                                        .listRowInsets(EdgeInsets())
                                        .listRowSeparatorTint(Color.gray.opacity(0.3))
                                        .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
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
                            .frame(width: 44,height: 44)

                           }
                .buttonStyle(.plain)
                .glassEffect(.regular.tint(Color.button).interactive(), in: .circle)
                .padding(.trailing,24)
                .padding(.bottom,12)
           
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment:.bottomTrailing)
                    
                }
            
            
            
            
            .navigationTitle("My Plants 🌱")
            
            .navigationBarBackButtonHidden(true)
            .onAppear { serReminder.requestNotificationPermission() }
            
            .onChange(of: serReminder.plants.map(\.isChecked)) {
                withAnimation { serReminder.sortPlants() }
            }
            //MARK: - Sheet
            
            .sheet(isPresented: $serReminder.showingSheet){
                
                AddPlantSheet(Sheet: serReminder)
                
            }
            
            
        }
    }
}

struct PlantProgressStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Capsule().fill(Color.gray.opacity(0.3))
                Capsule().fill(Color.button)
                    .frame(width: geo.size.width * (configuration.fractionCompleted ?? 0))
            }
        }
        .frame(height: 7)
    }
}
#Preview {
    SetReminder(serReminder: ReminderView())   
    }
