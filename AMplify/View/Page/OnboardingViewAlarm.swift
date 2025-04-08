//
//  OnboardingViewAlarm.swift
//  AMplify
//
//  Created by Priscilla Anthonio on 26/03/25.
//

import SwiftUI



struct OnboardingViewAlarm: View {
    
    
    
    @Binding var onboardingTab: Int
    
    @State private var isVibrate: Bool = true
    @State private var selectedTime = Date()
    @State private var alarms: [Date] = []
    @State private var alarmName: String = ""
    
    @State private var isErrorPresented: Bool = false
    
    @AppStorage("alarmTime") private var alarmTime: String = ""
    @AppStorage("alarmFreq") private var alarmFreq: String = ""
    @AppStorage("morningRoutineAlarmSound") private var morningRoutineAlarmSound: String = "Clock.mp3"
    
    @State private var errorMsg : String = ""
    
    var body: some View {
        
        ZStack {
            VStack{
                Text("Let's set your wake up Notification ⏰")
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
                        
                        
                        NavigationLink(destination: RepeatView().navigationBarBackButtonHidden()){
                            LabeledContent {
                                
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
                                
                            } label: {
                                Spacer()
                            }
                            
                        }.foregroundStyle(Color.black)
                        
                    }.listRowBackground(Color.lightGreyList)
                    
                    //                    Toggle("Vibration", isOn: $isVibrate)
                    //                        .listRowBackground(Color.lightGreyList)
                    
                }.frame(width: 400, height: 250)
                
                    .scrollContentBackground(.hidden)
                
                Button(action: {
                    let calendar = Calendar.current
                    var components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: selectedTime)
                    components.second = 0
                    
                    guard let hour = components.hour, let minute = components.minute else { return }
                    
                    let time = hour * 60 + minute
                    
//                    if time <= 0 || time >= 480 {
//                        errorMsg = "Time must be between 00:00 AM and 07:59 PM"
//                        isErrorPresented = true
//                    }
                    if alarmName.isEmpty {
                        errorMsg = "Please enter an alarm name"
                        isErrorPresented = true
                    }
                    else if alarmFreq.count == 0 {
                        errorMsg = "Please select at least 1 alarm frequency"
                        isErrorPresented = true
                    }
                    else {
                        selectedTime = calendar.date(from: components)!
                        
                        alarmTime = helperFunction.formatAlarmTime(time: selectedTime)
                        
                        
                        print(components.hour ?? 0)
                        print(components.minute ?? 0)
                        print(alarmName)
                        print(alarmFreq)
                        print(morningRoutineAlarmSound)
                        
                        for weekday in alarmFreq {
                            NotificationManager.instance.scheduleNotification(title: alarmName, subtitle: "🌤️ Morning Alarm", sound: morningRoutineAlarmSound, dateComponent: DateComponents(hour: hour, minute: minute, weekday: Int(String(weekday))), identifier: "\(alarmName)_\(weekday)", isRepeating: true)
                        }
                        withAnimation {
                            onboardingTab += 1
                        }
                    }
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
            }.alert("Error!", isPresented: $isErrorPresented){
                Button("OK", role: .cancel) {
                    isErrorPresented = false
                }
            } message: {
                Text(!errorMsg.isEmpty ? errorMsg : "")
            }
        }
        
        //                Color.blue
        //                    .frame(width: 243, height: 261.36)
        
        
    }
    
}







#Preview {
    OnboardingViewAlarm(onboardingTab: .constant(1))
}
