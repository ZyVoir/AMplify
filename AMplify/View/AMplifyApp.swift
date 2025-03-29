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
    
    @AppStorage("morningRoutinePhase") var phase : morningRoutinePhase = .none
    
    init() {
        registerBackgroundTask()
    }
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
    }
    
    func registerBackgroundTask() {
        BGTaskScheduler.shared.register(forTaskWithIdentifier: "AppleDeveloperAcademy.AMplify", using: nil) { task in
            self.handleDayChange()
            task.setTaskCompleted(success: true)
            self.scheduleBackgroundTask() // Reschedule for the next run
        }
    }
    
    func scheduleBackgroundTask() {
        let request = BGProcessingTaskRequest(identifier: "AppleDeveloperAcademy.AMplify")
        request.requiresNetworkConnectivity = false
        request.requiresExternalPower = false
        request.earliestBeginDate = Calendar.current.startOfDay(for: Date().addingTimeInterval(86400)) // Next day
        
        do {
            try BGTaskScheduler.shared.submit(request)
        } catch {
            print("Failed to schedule background task: \(error)")
        }
    }
    
    func handleDayChange() {
        print("New day detected! Run your function here.")
        // Your custom logic goes here
        phase = .done
    }
}
