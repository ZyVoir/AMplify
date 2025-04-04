//
//  OnboardingViewMR.swift
//  AMplify
//
//  Created by Priscilla Anthonio on 26/03/25.
//

import SwiftUI

struct OnboardingViewMR: View {
    @State private var hours = 0
    @State private var minutes = 0
    @State private var seconds = 0

    var body: some View {
        ZStack{
            VStack{
                Text("Now set your Morning Routine duration ☀️")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                // Time Picker
                ZStack{
                    // Transparent Overlay for Unified Selection Box
//                    RoundedRectangle(cornerRadius: 10)
//                        .fill(Color.lightGreyPicker) // Light grey background
//                        .frame(width: 320, height: 50)
                    
                    HStack {
                        Picker("Hours", selection: $hours) {
                            ForEach(0..<24, id: \.self) { Text("\($0) hours") }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 100)
                        

                        Picker("Minutes", selection: $minutes) {
                            ForEach(0..<60, id: \.self) { Text("\($0) min") }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 100)

                        Picker("Seconds", selection: $seconds) {
                            ForEach(0..<60, id: \.self) { Text("\($0) sec") }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 100)
                    }
                    .padding()
                }
                           

                
                List{
                    HStack{
                        Text("When Timer Ends")
                        Spacer()
                        
                        NavigationLink(destination: TimerSoundView()){
                            LabeledContent {
                                Text("Radial")
                            } label: {
                                Spacer()
                            }

                        }.foregroundStyle(Color.black)
                        
                    }.padding(18)
                        .listRowBackground(Color.lightGreyList)
                } .scrollContentBackground(.hidden)
                
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
            }
        }
    }
}

#Preview {
    OnboardingViewMR()
}
