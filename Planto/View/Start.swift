//
//  ContentView.swift
//  Planto
//
//  Created by raghad2003 on 29/05/1448 AH.
//

import SwiftUI

struct Start: View {
    @AppStorage("hasSeenStartView") var hasSeenStartView: Bool = false
    
    @AppStorage("openSheetOnStart") var openSheetOnStart: Bool = false
    
    @StateObject var start = ReminderView()

    
    var body: some View {
        NavigationStack{
            Divider()
            ZStack(alignment: .top){
                ScrollView {
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

                                Text("Set Plant Reminder")

                                .font(.system(size: 16, weight: .semibold))
                                       .frame(width: 280, height: 35)
                            
                        }
                        .buttonStyle(.glassProminent)
                        .tint(Color.button)
                        .padding(.top, 65)
                        .simultaneousGesture(TapGesture().onEnded {
                            hasSeenStartView = true
                            openSheetOnStart = true
                        })
                    }
                }
            }
            .navigationTitle("My Plants 🌱")
            
            .onAppear {
                start.requestNotificationPermission()}
        }
    }
}

#Preview {
    Start()
}
