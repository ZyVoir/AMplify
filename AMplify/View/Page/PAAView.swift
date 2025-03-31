//
//  PAAView.swift
//  AMplify
//
//  Created by William on 29/03/25.
//

import SwiftUI

struct PAAView: View {
    
    @Binding var isTransitionComplete: Bool

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button {
            dismiss()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation {
                    isTransitionComplete = true
                }
            }
        } label : {
            Text("PAAView")
        }

    }
}

#Preview {
    HomeView()
}
