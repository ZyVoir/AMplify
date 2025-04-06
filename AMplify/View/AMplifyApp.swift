//
//  AMplifyApp.swift
//  AMplify
//
//  Created by William on 23/03/25.
//

import SwiftUI
import BackgroundTasks

@main
struct AMplifyApp: App {
    

    @AppStorage("morningRoutinePhase") private var phase: morningRoutinePhase = .none
    @AppStorage("lastCheckedDate") private var lastCheckedDate: String = ""
    @AppStorage("isOnboarding") private var isOnboarding: Bool = true
    
    
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
            isOnboarding = true
            return
        }
        
        if today != lastCheckedDate {
            print("🌅 New day detected! Running daily task...")
            lastCheckedDate = today
            phase = .alarmAndPAA
        } else {
            print("✅ Same day, no action needed")
        }
    }
    

}

