//
//  helperFunction.swift
//  AMplify
//
//  Created by William on 27/03/25.
//

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
}


