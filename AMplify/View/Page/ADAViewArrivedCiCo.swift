//
//  ADAViewArrivedCiCo.swift
//  AMplify
//
//  Created by Sufi Arifin on 06/04/25.
//

import SwiftUI

struct ArrivalView: View {
    
    @StateObject private var locationManager : LocationManager = LocationManager.shared
    
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
                    Text("29")
                        .font(.system(size: 100, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(15)

                    Text(":")
                        .font(.system(size: 100, weight: .semibold))
                        .foregroundColor(.white)

                    Text("59")
                        .font(.system(size: 100, weight: .semibold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(15)
                }
                .padding(.top, -35)
                .padding(.bottom, 35)
                
                Text("You've Arrived at")
                    .font(.system(size: 27, weight: .semibold))
                    .foregroundColor(.white)

                Text("Apple Developer Academy")
                    .font(.system(size: 27, weight: .semibold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 5)

                Text("0 km away!")
                    .font(.system(size:25, weight: .regular))
                    .foregroundColor(.white)
                    .padding(.bottom, 30)

                // Tombol "Clock In"
                Button(action: {
                    // Aksi yang akan dijalankan saat tombol ditekan
                    print("Clock In button tapped")
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
            .padding()
        }
    }
}

struct ArrivalView_Previews: PreviewProvider {
    static var previews: some View {
        ArrivalView()
    }
}
