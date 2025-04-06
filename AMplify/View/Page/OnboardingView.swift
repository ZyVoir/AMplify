//
//  OnboardingView.swift
//  AMplify
//
//  Created by William on 26/03/25.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var onboardingTab : Int = 0
    
    var body: some View {
        ZStack {
            
            switch onboardingTab {
            case 0:
                OnboardingViewName(onboardingTab: $onboardingTab)
            case 1:
                OnboardingViewAlarm(onboardingTab: $onboardingTab)
            case 2:
                OnboardingViewMR(onboardingTab: $onboardingTab)
            case 3:
                OnboardingViewPAA(onboardingTab: $onboardingTab)
            case 4:
                OnboardingViewDifficulty(onboardingTab: $onboardingTab)
            case 5:
                OnboardingViewLocation()
            default:
                EmptyView()
            }
        }.navigationBarBackButtonHidden()
        
    }
}

#Preview {
    OnboardingView()
}
