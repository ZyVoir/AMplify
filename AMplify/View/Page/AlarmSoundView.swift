//
//  AlarmSoundView.swift
//  AMplify
//
//  Created by Priscilla Anthonio on 27/03/25.
//

import SwiftUI

struct AlarmSoundView: View {
    
    @State private var selectedSound: String = "Clock.mp3"
    let alarmSounds = ["Clock.mp3", "Facility.wav"]

    func setSelectedSound() {
        UserDefaults.standard.set(selectedSound, forKey: "alarmSound")
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
                selectedSound = UserDefaults.standard.string(forKey: "alarmSound") ?? "Clock.mp3"
            }
            .onDisappear{
                SoundManager.shared.stopSound()
            }
            .navigationTitle("Alarm Sound")
        }
        
        .scrollContentBackground(.hidden)
    }
}

struct RadioButton: View {
    var isSelected: Bool
    
    var body: some View {
        Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
            .foregroundStyle(isSelected ? Color.teal : Color.gray)
    }
}

#Preview {
    AlarmSoundView()
}
