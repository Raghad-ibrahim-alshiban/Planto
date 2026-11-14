//
//  ContentView.swift
//  Planto
//
//  Created by raghad2003 on 29/05/1448 AH.
//

import SwiftUI

struct Start: View {
    var body: some View {
        NavigationStack{
            Divider()
                    .background {Color.gray.opacity(0.3)}
            ZStack(alignment: .top){
                Color("")
                    .ignoresSafeArea()
                VStack(alignment: .center
                       , spacing:23)
                {
                    Image(.imgPlanto)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 45)
                    Text("Start your plant journey!")
                        .font(.system(size: 25 , weight: .semibold))

                    Text("Now all your plants will be in one place and \nwe will help you take care of them :)🪴")
                        .font(.system(size: 16 , weight: .semibold , ))
                        .foregroundStyle(.grayText)
                        .multilineTextAlignment(.center)
                    
                    NavigationLink(destination:SetReminder()){
                        ZStack{
                            RoundedRectangle(cornerRadius:20)
                       .frame(width:300 ,height: 40)
                       .foregroundStyle(.button)
                            Text("Set Plant Reminder")
                                .font(.system(size:16,weight: .semibold))
                                .foregroundStyle(.white)


                        }
                        .padding(.horizontal, 12)
                        .padding(.top, 65)

                    }
                }
            }
            .navigationTitle("My Plants 🌱")
        }
    }
}

#Preview {
    Start()
}
