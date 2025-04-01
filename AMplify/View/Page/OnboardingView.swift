//
//  OnboardingView.swift
//  AMplify
//
//  Created by William on 26/03/25.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack {
            TabView {
                //TODO : Fill this with each page of the onboardingView, 1 onboardingView -> 1 page View in Page folder

                OnboardingViewName()
                    .navigationBarBackButtonHidden()
              
                OnboardingViewAlarm()
                    .navigationBarBackButtonHidden()
              
                OnboardingViewMR()
                    .navigationBarBackButtonHidden()
              
                OnboardingViewPAA()
                    .navigationBarBackButtonHidden()
              
                OnboardingViewDifficulty()
                    .navigationBarBackButtonHidden()
              
                OnboardingViewLocation()
                    .navigationBarBackButtonHidden()

            }.tabViewStyle(.page(indexDisplayMode: .never))
                
        }
    }
}

#Preview {
    OnboardingView()
}
