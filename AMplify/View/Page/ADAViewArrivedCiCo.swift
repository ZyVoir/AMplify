//
//  ADAViewArrivedCiCo.swift
//  AMplify
//
//  Created by Sufi Arifin on 06/04/25.
//

import SwiftUI

struct ArrivalView: View {
    
    @StateObject private var locationManager : LocationManager = LocationManager.shared
    
    @State private var distanceToAcademy : Double = Double.infinity
    
    @State private var now : Date = Date()

    @State private var isCompleted : Bool = false
    @State private var alertMsg : String = ""
    
    @AppStorage("isMorningRoutineStarted") private var isMorningRoutineStarted: Bool = false
    
    @AppStorage("StreakCount") private var streakCount: Int = 0
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var isTransitionComplete: Bool
    
    var academyGraceTime : Date {
        let calendar = Calendar.current
        
        var dateComponents = calendar.dateComponents([.year,.month,.day], from: Date())
        
        dateComponents.hour = 8
        dateComponents.minute = 0
        dateComponents.second = 0
        
        return calendar.date(from: dateComponents) ?? Date()
    }
    
    var safeCountdownRange: ClosedRange<Date> {
        now...(academyGraceTime > now ? academyGraceTime : now)
    }
    
    var body: some View {
        ZStack {
            
            Color(.orange)
                .ignoresSafeArea()

            VStack {
                Image(systemName: "iphone.badge.location")
                    .font(.system(size: 125))
                    .foregroundColor(.white)
                    .padding(.top, -10)
                    .symbolEffect(.breathe)
                
                HStack(spacing: 10) {
                    Text(timerInterval: safeCountdownRange, countsDown: true)
                        .font(.system(size: 70, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(15)

                   
                }
                .padding(.top, -35)
                .padding(.bottom, 35)
                
                Text(distanceToAcademy < 0.15 ? "You've Arrived at \nApple Developer Academy" : "You're still far from \nApple Developer Academy")
                    .font(.system(size: 27, weight: .semibold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 25)

                Text(distanceToAcademy == Double.infinity ? "Loading..." : String(format: "%.2f km(s) away!", distanceToAcademy))
                    .font(.system(size:25, weight: .regular))
                    .foregroundColor(.white)
                    .padding(.bottom, 30)
                    .onChange(of: locationManager.distanceFromAcademy) { oldValue, newValue in
                        distanceToAcademy = LocationManager.shared.distanceFromAcademy
                    }
                    .onAppear{
                        distanceToAcademy = Double(LocationManager.shared.distanceFromAcademy)
                    }
                // Tombol "Clock In"
                if distanceToAcademy < 0.15 {
                    Button(action: {
                        // Aksi yang akan dijalankan saat tombol ditekan
                        print("Clock In button tapped")
                        LocationManager.shared.stopUpdatingLocation()
                        isMorningRoutineStarted = false
                        
                        if Date() > academyGraceTime {
                            streakCount = 0
                        }
                        else {
                            streakCount += 1
                        }
                        
                        isCompleted = true
                    }) {
                        HStack {
                            Text("Clock In")
                                .font(.system(size: 20, weight: .semibold))
                            Image(systemName: "arrow.right")
                        }
                        .foregroundColor(.orange)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
            }
            .padding()
        }
        .alert(Date() > academyGraceTime ? "Late" : streakCount == 0 ? "On Time" : "\(streakCount) Day(s) Streak!", isPresented: $isCompleted){
            Button("Clock In", role: .cancel) {
                isCompleted = false
                
                dismiss()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {
                        isTransitionComplete = true
                    }
                }
            }
        } message: {
            Text("Complete your daily quests so your streak won’t reset!")
                .padding(.vertical)
        }
    }
}

#Preview {
    ArrivalView(isTransitionComplete: .constant(false))
}
