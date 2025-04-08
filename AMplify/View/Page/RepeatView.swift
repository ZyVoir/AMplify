//
//  RepeatView.swift
//  AMplify
//
//  Created by Priscilla Anthonio on 27/03/25.
//

import SwiftUI

struct RepeatView: View {
    
    @State private var selectedDays: Set<String> = []
    let daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    @AppStorage("alarmFreq") private var alarmFreq: String = ""
    
    func storeAlarmFreq() {
        var alarmFreqString = ""
        
        for day in selectedDays {
            alarmFreqString += String(daysOfWeek.firstIndex(of: day)!)
            
        }
        print(alarmFreqString)
        alarmFreq = alarmFreqString
    }
    

    var body: some View {
        
        NavigationStack {
            List {
                ForEach(daysOfWeek, id: \.self) { day in
                    HStack {
                        Text("Every \(day)")
                        Spacer()
                        
                        if selectedDays.contains(day) {
                            Image(systemName: "checkmark.circle.fill") // Selected icon
                                .foregroundStyle(Color.teal)
                        } else {
                            Image(systemName: "circle") // Unselected icon
                                .foregroundStyle(Color.gray)
                            
                        }
                    }
                    .contentShape(Rectangle()) // Makes the whole row tappable
                    .listRowBackground(Color.lightGreyList)
                    .onTapGesture {
                        
                        if selectedDays.contains(day) {
                            selectedDays.remove(day)
                        } else {
                            selectedDays.insert(day)
                        }
                    

                        storeAlarmFreq()
                    }
                }
            }
            .onAppear{
                
                
                for char in alarmFreq {
                    selectedDays.insert(daysOfWeek[Int(String(char))!])
                }
            }
            .navigationTitle("Repeat")
            
            
            //                    .toolbar{
            //                        ToolbarItem(placement: .navigationBarLeading){
            //                            Button(action : {
            //                                presentationMode.wrappedValue.dismiss()
            //                            }){
            //                                Image(systemName: "chevron.left")
            //                                    .foregroundStyle(Color.blue)
            //                            }
            //                        }
            //                    }
            .listRowBackground(Color.lightGreyList)
            
            .scrollContentBackground(.hidden)
        }
        
    }
}

#Preview {
    RepeatView()
}
