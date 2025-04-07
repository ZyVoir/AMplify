//
//  helperFunction.swift
//  AMplify
//
//  Created by William on 27/03/25.
//

import Foundation

struct helperFunction {
    static func getMorningPhaseOrder(state : String) -> Int {
        switch state {
        case morningRoutinePhase.none.rawValue:
            return 0
        case morningRoutinePhase.alarmAndPAA.rawValue:
            return 1
        case morningRoutinePhase.morningRoutine.rawValue:
            return 2
        case morningRoutinePhase.ADA.rawValue:
            return 3
        case morningRoutinePhase.done.rawValue:
            return 4
        default:
            return -1
        }
        
    }
    
    static func isValidUsername(state : String) -> Bool {
        if state.isEmpty || state.count <= 0 {
            return false
        }
        
        return state.unicodeScalars.allSatisfy { CharacterSet.letters.contains($0) }
    }
    
    static func formatAlarmTime(time : Date) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm:ss"
        return timeFormatter.string(from: time)
    }
    
    static func addSecondsToTime(initialTime: String, secondsToAdd: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        
  
        guard let date = dateFormatter.date(from: initialTime) else {
            return ""
        }
    
        let newDate = date.addingTimeInterval(TimeInterval(secondsToAdd))
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "HH:mm:ss"
        return outputFormatter.string(from: newDate)
    }

}


