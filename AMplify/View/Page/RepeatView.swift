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
    @Environment(\.dismiss) var dismiss
    
    func storeAlarmFreq() {
        var alarmFreqString = ""
        
        for day in selectedDays {
            alarmFreqString += String(daysOfWeek.firstIndex(of: day)!)
            
        }
        print(alarmFreqString)
        alarmFreq = alarmFreqString
    }
    
    
    var body: some View {
        
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                    Text("Back")
                    
                }
                .tint(.blue)
                .padding(.leading)
                Spacer()
            }
            
            HStack {
                Text("Repeat")
                    .font(.system(size: 35, weight: .bold))
                    .padding([.top, .leading])
                Spacer()
            }
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
            
            
//            
//                                .toolbar{
//                                    ToolbarItem(placement: .navigationBarLeading){
//                                        Button(action : {
//                                            
//                                        }){
//                                            Image(systemName: "chevron.left")
//                                                .foregroundStyle(Color.blue)
//                                        }
//                                    }
//                                }
            .listRowBackground(Color.lightGreyList)
            .scrollContentBackground(.hidden)
            .scrollDisabled(true)
        }
        
    }
}

#Preview {
    RepeatView()
}
