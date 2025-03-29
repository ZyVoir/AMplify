//
//  MorningRoutineView.swift
//  AMplify
//
//  Created by William on 29/03/25.
//

import SwiftUI

struct MorningRoutineView: View {
    
    @Binding var isTransitionComplete: Bool
    
    var body: some View {
        Text("Morning Routine View")
    }
}

#Preview {
    MorningRoutineView(isTransitionComplete: .constant(false))
}
