//
//  SoundManager.swift
//  AMplify
//
//  Created by William on 06/04/25.
//

import Foundation
import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    var player: AVAudioPlayer?
    
    func playSound(named soundName: String, extension fileExtension: String? = "mp3", loop : Bool = false) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: fileExtension) else {
            print("Sound file not found")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            
            if loop {
                player?.numberOfLoops = -1
            }
            
            player?.play()
            
            print("Sound Played")
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    func stopSound() {
        if player?.isPlaying == true {
            player?.stop()
        }
    }
}

