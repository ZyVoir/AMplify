//
//  PAAView.swift
//  AMplify
//
//  Created by William on 29/03/25.
//

import SwiftUI

struct PAAView: View {
    
    @Binding var isTransitionComplete: Bool
    
    var body: some View {
        Text("PAAView")
    }
}

#Preview {
    PAAView(isTransitionComplete: .constant(false))
}
