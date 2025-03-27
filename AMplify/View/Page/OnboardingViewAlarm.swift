//
//  OnboardingViewAlarm.swift
//  AMplify
//
//  Created by Priscilla Anthonio on 26/03/25.
//

import SwiftUI

struct OnboardingViewAlarm: View {

    @State private var isVibrate: Bool = true
    @State private var selectedTime = Date()
    @State private var alarms: [Date] = []
    
    var body: some View {
        
        ZStack {
            VStack{
                Text("Let's set your wake up Alarm ⏰")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                NavigationStack {
                    VStack {
                        // DatePicker for selecting alarm time
                        DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                            .datePickerStyle(WheelDatePickerStyle())
                            .padding(.all, 50)
                           
                        
                        // List of saved alarms
                        List {
                            ForEach(alarms, id: \.self) { alarm in
                                Text(alarm.formatted(date: .omitted, time: .shortened))
                            }
                            .onDelete { indexSet in
                                alarms.remove(atOffsets: indexSet)
                            }
                        }
                        .listStyle(PlainListStyle())
                    }
                }.frame(alignment: .center)
            }
        }
                
//                Color.blue
//                    .frame(width: 243, height: 261.36)
                
                    List{
                        HStack{
                            Text("Repeat")
                            Spacer()
                            Label("", systemImage: "chevron.forward")
                                .foregroundStyle(Color.black)
                                .labelStyle(.iconOnly)
                                .frame(alignment: .trailing)
                                
                        }
                        
                        HStack {
                            Text("Alarm name")
                            Spacer()
                            Label("", systemImage: "chevron.forward")
                                .foregroundStyle(Color.black)
                                .labelStyle(.iconOnly)
                                .frame(alignment: .trailing)
                        }
                        
                        
                        HStack {
                            Text("Alarm sound")
                            Spacer()
                            Label("", systemImage: "chevron.forward")
                                .foregroundStyle(Color.black)
                                .labelStyle(.iconOnly)
                                .frame(alignment: .trailing)
                        }
                        
                        Toggle("Vibration", isOn: $isVibrate)
                    }.frame(width: 400, height: 250)

        
        Button(action: {
            print("Placeholder")
        }) {
            HStack{
                Text("Continue")
                    .font(.headline)
                Image(systemName: "arrow.right")
            }

                .frame(width: 350, height: 50)
                .background(Color.teal)
                .foregroundColor(.white)
                .cornerRadius(12)
            
        }
                    //                .frame(width: 361, height: 205)
                }
                
            }
        
        
            
  



#Preview {
    OnboardingViewAlarm()
}
