//
//  AlarmSoundView.swift
//  AMplify
//
//  Created by Priscilla Anthonio on 27/03/25.
//

import SwiftUI

struct AlarmSoundView: View {
    
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
