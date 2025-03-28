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
    @State private var alarmName: String = ""
    
    var body: some View {
        
        ZStack {
            VStack{
                Text("Let's set your wake up Alarm ⏰")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                
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
                .frame(alignment: .center)
                .frame(alignment: .center)
                
                List{
                    HStack{
                        Text("Repeat")
                        Spacer()
                        
                        
                        NavigationLink(destination: RepeatView()){
                            LabeledContent {
                                Text("Weekdays")
                            } label: {
                                Spacer()
                            }

                        }.foregroundStyle(Color.black)

                        
                    }.listRowBackground(Color.lightGreyList)
                    
                    HStack {
                        Text("Label")
                        Spacer()
                        
                        TextField("Alarm", text: $alarmName)
                            .foregroundStyle(Color.black)
                            .frame(alignment: .trailing)
                            .multilineTextAlignment(.trailing)
                        
                    }.listRowBackground(Color.lightGreyList)
                    
                    
                    HStack {
                        Text("Alarm sound")
                        Spacer()
    
                        NavigationLink(destination: AlarmSoundView()){
                            LabeledContent {
                                Text("Radial")
                            } label: {
                                Spacer()
                            }

                        }.foregroundStyle(Color.black)
                        
                    }.listRowBackground(Color.lightGreyList)
                    
                    Toggle("Vibration", isOn: $isVibrate)
                        .listRowBackground(Color.lightGreyList)
                    
                }.frame(width: 400, height: 250)
                
                    .scrollContentBackground(.hidden)
                
                
                
                
                
                
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
        
        //                Color.blue
        //                    .frame(width: 243, height: 261.36)
        

    }
    
}







#Preview {
    OnboardingViewAlarm()
}
