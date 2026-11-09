//
//  ContentView.swift
//  Planto
//
//  Created by raghad2003 on 29/05/1448 AH.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .center , spacing:23) {
                Image(.imgPlanto)
                    .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 12)

                Text("Start a your plant journey!")
                    .font(.system(size: 25 , weight: .semibold))
                    .padding(.vertical,4)
                Text("Now all your plants will be in one place and we will help you take care of them :)🪴")
                    .font(.system(size: 16 , weight: .semibold , ))
                    
            }
            .padding()
        }
        .navigationTitle("My Plants 🌱")
    }
}
#Preview {
    ContentView()
}
