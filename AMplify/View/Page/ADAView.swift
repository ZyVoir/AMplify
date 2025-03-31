//
//  ADAView.swift
//  AMplify
//
//  Created by William on 29/03/25.
//

import SwiftUI

struct ADAView: View {
    
    @Binding var isTransitionComplete: Bool
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        Button {
            
            dismiss()
            
            withAnimation {
                isTransitionComplete = true
            }
        } label : {
            Text("ADA View")
        }
    }
}

#Preview {
    ADAView(isTransitionComplete: .constant(false))
}
