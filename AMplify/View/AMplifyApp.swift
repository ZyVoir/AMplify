//
//  AMplifyApp.swift
//  AMplify
//
//  Created by William on 23/03/25.
//

import SwiftUI

@main
struct AMplifyApp: App {
    

    @AppStorage("morningRoutinePhase") private var phase: morningRoutinePhase = .none
    @AppStorage("lastCheckedDate") private var lastCheckedDate: String = ""
    @AppStorage("isOnboarding") private var isOnboarding: Bool = true
    @AppStorage("isMorningRoutineStarted") private var isMorningRoutineStarted: Bool = false
    @AppStorage("alarmTime") var alarmTime: String = "07:00:00"
    @AppStorage("alarmSound") var alarmSound : String = "Clock.mp3"
    
    init() {
        

    }
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .onAppear {
                    checkForNewDay()
                }
        }
    }
    
    func checkForNewDay() {
        let today = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none)
        
        print("isOnboarding : \(isOnboarding)")
        print("lastCheckedDate : \(lastCheckedDate)")
        
        if isOnboarding {
            phase = .none
            return
        }
        
        if today != lastCheckedDate {
            print("🌅 New day detected!")
            lastCheckedDate = today
            
    
            let currentTime = Date()
            let formattedAlarmTime : Date = helperFunction.formatStringToDate(time: alarmTime)
            let formattedAcademyAlarmTime : Date = helperFunction.formatStringToDate(time: "08:00:00")
            
            if !isMorningRoutineStarted && (formattedAlarmTime <= currentTime && currentTime < formattedAcademyAlarmTime) {
                print("Day changed, reseting morning routine")
                isMorningRoutineStarted = true
                phase = .alarmAndPAA
                SoundManager.shared.playSound(named: alarmSound.components(separatedBy: ".").first!, extension: alarmSound.description.components(separatedBy: ".")[1],loop: true)
            }
            else if !isMorningRoutineStarted {
                phase = .none
            }
            
        } else {
            print("✅ Same day, no action needed")
        }
    }
    

}

