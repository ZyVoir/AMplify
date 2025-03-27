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
                OnboardingViewAlarm()
                OnboardingViewMR()
                 
            }.tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    }
}

#Preview {
    OnboardingView()
}
