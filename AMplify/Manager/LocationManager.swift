//
//  LocationManager.swift
//  AMplify
//
//  Created by William on 06/04/25.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    static let shared = LocationManager()
    
    private let manager = CLLocationManager()
    @Published var userLocation: CLLocationCoordinate2D?
    
    let appleDevAcademyLocation = CLLocation(latitude: -6.301976713655676, longitude: 106.65306645086578)
    @Published var distanceFromAcademy : Double = Double.infinity
    
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    
    
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.allowsBackgroundLocationUpdates = true
                manager.pausesLocationUpdatesAutomatically = false
    }
    
    func requestPermission() {
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async {
            self.userLocation = location.coordinate
            self.authorizationStatus = manager.authorizationStatus
            
            self.distanceFromAcademy = location.distance(from: self.appleDevAcademyLocation)/1000
            
            print("Updating Location : \(self.distanceFromAcademy)")
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get location: \(error.localizedDescription)")
    }
}
