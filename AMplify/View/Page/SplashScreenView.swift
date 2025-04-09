//
//  SplashScreenView.swift
//  AMplify
//
//  Created by William on 26/03/25.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    
    
    var body: some View {
        if isActive {
            HomeView()
        }
        else {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color("BG Linear 1"), Color("BG Linear 2")]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .onTapGesture {
                        helperFunction.reset()
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
