//
//  TimerSoundView.swift
//  AMplify
//
//  Created by Priscilla Anthonio on 28/03/25.
//

import SwiftUI

struct TimerSoundView: View {
    
    @State private var selectedSound: String = "Radar"
    let alarmSounds = ["Radar", "Beacon", "Chimes", "Circuit", "Reflection", "Waves"]
    
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(alarmSounds, id: \.self){ sound in
                    HStack{
                        Text(sound)
                        Spacer()
                        RadioButton(isSelected: selectedSound == sound)
                    }
                    .contentShape(Rectangle())
                    .listRowBackground(Color.lightGreyList)
                    .onTapGesture{
                        selectedSound = sound
                    }
                }
            }
            .navigationTitle("Timer Sound")
        }
        
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    TimerSoundView()
}
