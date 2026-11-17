
//  Planto


import SwiftUI

struct Start: View {
    @AppStorage("hasSeenStartView") var hasSeenStartView: Bool = false
    @ObservedObject var viewModel: ReminderView
    
    
    
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
                        
                        Button {
                            viewModel.startAdding()
                        } label: {
                            Text("Set Plant Reminder")
                                .font(.system(size: 16, weight: .semibold))
                                .frame(width: 280, height: 35)
                        }
                        .buttonStyle(.glassProminent)
                        .tint(Color.button)
                        .padding(.top, 65)
                        
                    }
                }
            }
            .navigationTitle("My Plants 🌱")
            
            .onAppear {
                viewModel.requestNotificationPermission()
            }
            .sheet(isPresented: $viewModel.showingSheet, onDismiss: {
                if !viewModel.plants.isEmpty { hasSeenStartView = true }
            }) {
                AddPlantSheet(Sheet: viewModel)
            }
        }
    }
}

#Preview {
    Start(viewModel: ReminderView())
}
