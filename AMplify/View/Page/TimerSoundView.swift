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
    
    @Environment(\.dismiss) var dismiss
    
    func setSelectedSound() {
        morningRoutineAlarmSound = selectedSound
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
                Text("Timer Sound")
                    .font(.system(size: 35, weight: .bold))
                    .padding([.top, .leading])
                Spacer()
            }
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
            .scrollContentBackground(.hidden)
            .scrollDisabled(true)
        }
    }
}

#Preview {
    TimerSoundView()
}
