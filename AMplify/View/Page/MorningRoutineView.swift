//
//  MorningRoutineView.swift
//  AMplify
//
//  Created by William on 29/03/25.
//

import SwiftUI

struct MorningRoutineView: View {
    
    @Binding var isTransitionComplete: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button {
            isTransitionComplete = true
            dismiss()
        } label : {
            Text("MorningRoutineView")
        }
    }
}

#Preview {
    MorningRoutineView(isTransitionComplete: .constant(false))
}
