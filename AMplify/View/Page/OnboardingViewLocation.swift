//
//  OnboardingViewLocation.swift
//  AMplify
//
//  Created by Sufi Arifin on 26/03/25.
//

import SwiftUI
import CoreLocation
import MapKit

struct OnboardingViewLocation: View {
    @Environment(\.dismiss) private var dismiss
    @AppStorage("isOnboarding") private var isOnboarding: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Finally,")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 50)
            
            Spacer()
            
            Image(systemName: "iphone.badge.location")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.red)
                .symbolEffect(.breathe)
            
            Text("Enable precise location")
                .font(.title)
                .bold()
                .padding(.top)
            
            Text("We’ll use your location to track your current position in relation to the Apple Developer Academy.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Spacer()
            
            VStack(spacing: 10) {
                Button(action: {
                    LocationManager.shared.requestPermission()
                    
                    if LocationManager.shared.authorizationStatus == .authorizedAlways || LocationManager.shared.authorizationStatus == .authorizedWhenInUse {
                        isOnboarding = false
                        dismiss()
                    }
                }) {
                    Text("Allow Location")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("TealNormal"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 30)
                
                Button(action: {
                    // Handle Maybe Later action
                    dismiss()
                }) {
                    Text("Maybe Later")
                        .foregroundColor(.gray)
                }
            }
            
            Spacer(minLength: 30)
        }.onChange(of: LocationManager.shared.authorizationStatus) { oldValue, newValue in
            if newValue == .authorizedAlways || newValue == .authorizedWhenInUse {
                isOnboarding = false
                dismiss()
            }
        }
    }
    
}

    
#Preview {
        OnboardingViewLocation()
}

