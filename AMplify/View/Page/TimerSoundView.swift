//
//  TimerSoundView.swift
//  AMplify
//
//  Created by Priscilla Anthonio on 28/03/25.
//

import SwiftUI

struct TimerSoundView: View {
    
    @State private var selectedSound: String = "Clock.mp3"
    let alarmSounds = ["Clock.mp3", "Facility.wav"]

    @AppStorage("morningRoutineAlarmSound") var morningRoutineAlarmSound: String = "Clock.mp3"
    
    func setSelectedSound() {
        morningRoutineAlarmSound = selectedSound
    }
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(alarmSounds, id: \.self){ sound in
                    HStack{
                        Text(sound.components(separatedBy: ".").first!)
                        Spacer()
                        RadioButton(isSelected: selectedSound == sound)
                    }
                    .contentShape(Rectangle())
                    .listRowBackground(Color.lightGreyList)
                    .onTapGesture{
                        selectedSound = sound
                        
                        SoundManager.shared.playSound(named: sound.components(separatedBy: ".").first!, extension: sound.description.components(separatedBy: ".")[1])
                        
                        setSelectedSound()
                    }
                }
            }
            .onAppear{
                selectedSound = morningRoutineAlarmSound
            }
            .onDisappear{
                SoundManager.shared.stopSound()
            }
            .navigationTitle("Timer Sound")
        }
        
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    TimerSoundView()
}
