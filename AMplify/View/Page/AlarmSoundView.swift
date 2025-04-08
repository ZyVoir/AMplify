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
    
    @Environment(\.dismiss) var dismiss
    
    func setSelectedSound() {
        UserDefaults.standard.set(selectedSound, forKey: "alarmSound")
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
                Text("Alarm Sound")
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
                selectedSound = UserDefaults.standard.string(forKey: "alarmSound") ?? "Clock.mp3"
            }
            .onDisappear{
                SoundManager.shared.stopSound()
            }
            .scrollContentBackground(.hidden)
            .scrollDisabled(true)
        }
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
