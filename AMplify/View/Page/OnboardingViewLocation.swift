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
    @StateObject private var locationManager = LocationManager()
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 0, longitude: 0),span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
    
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
            
            if let location = locationManager.userLocation {
                Text("Your Location: \(location.latitude), \(location.longitude)")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
            
            Spacer()
            
            VStack(spacing: 10) {
                Button(action: {
                    locationManager.requestPermission()
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
                }) {
                    Text("Maybe Later")
                        .foregroundColor(.gray)
                }
            }
            
            Spacer(minLength: 30)
        }
    }
    
    class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
        private let manager = CLLocationManager()
        @Published var userLocation: CLLocationCoordinate2D?
        
        override init() {
            super.init()
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyBest
        }
        
        func requestPermission() {
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            DispatchQueue.main.async {
                self.userLocation = location.coordinate
            }
            
        }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Failed to get location: \(error.localizedDescription)")
        }
    }
}

    
#Preview {
        OnboardingViewLocation()
}

