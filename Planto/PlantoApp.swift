//
//  PlantoApp.swift
//  Planto
//
//  Created by raghad2003 on 29/05/1448 AH.
//

import SwiftUI

@main
struct PlantoApp: App {
    @AppStorage("hasSeenStartView") var hasSeenStartView :Bool = false

    var body: some Scene {
        WindowGroup {

            if hasSeenStartView{
                SetReminder()
                    .preferredColorScheme(.dark)

            }else{
                Start()
                    .preferredColorScheme(.dark)

            }
        }

    }
}
