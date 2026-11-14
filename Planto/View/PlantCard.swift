//
//  PlantCard.swift
//  Planto
//
//  Created by raghad2003 on 04/06/1448 AH.
//

import SwiftUI

struct PlantCard: View {
    @Binding var plant: PlantoName

    var body: some View {
        HStack{
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
                        .foregroundStyle(.gray)
                    
                    Text("in \(plant.room.rawValue) ")
                        .font(.system(size: 16))
                        .foregroundStyle(.gray)
                }
                
                Text(plant.name)
                    .font(.system(size: 30 ,weight:.semibold))
                HStack(spacing: 24){
                    HStack (spacing:18){
                        Image(systemName: "sun.max")
                            .font(.system(size: 14))
                        Text(plant.light.rawValue)
                            .font(.system(size: 12 ,weight: .medium))
                    }
                    .padding(.horizontal ,8)
                    .padding(.vertical ,4)
                    .background(Color.gray.opacity(0.2))
                    .foregroundStyle(.yellow)
                    .cornerRadius(8)
                    HStack (spacing:18){
                        Image(systemName: "drop")
                            .font(.system(size: 14))
                        Text(plant.water.rawValue)
                            .font(.system(size: 12 ,weight: .medium))
                    }
                    .padding(.horizontal ,8)
                    .padding(.vertical ,4)
                    .background(Color.gray.opacity(0.2))
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
    }
}

#Preview {
    PlantCard(plant: .constant(
            PlantoName(name: "Pothos", wateringDay: .evreyD, water: .twn, room: .bedr, light: .full)
        ))
}
