//
//  Background.swift
//  AMplify
//
//  Created by William on 26/03/25.
//

import SwiftUI

struct Background: View {
    
    var color : String?
    
    var image : String?
    
    var body: some View {
        if let color = color {
            Color(color).ignoresSafeArea()
        }
        else if let image = image {
            Image(image).ignoresSafeArea()
        }
        
        
    }
}

#Preview {
    Background(color: "White")
}
