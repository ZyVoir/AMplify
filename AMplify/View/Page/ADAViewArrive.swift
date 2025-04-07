//
//  ADAViewArrive.swift
//  AMplify
//
//  Created by Sufi Arifin on 06/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Color(.orange)
                .ignoresSafeArea()

            VStack {
                Image(systemName: "iphone.badge.location")
                    .font(.system(size: 125))
                    .foregroundColor(.white)
                    .padding(.top, -100)
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

                Text("Arriving at Apple")
                    .font(.system(size: 27, weight: .semibold))
                    .foregroundColor(.white)

                Text("Developer Academy")
                    .font(.system(size: 27, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.bottom, 15)

                Text("15 km away!")
                    .font(.system(size: 25, weight: .regular))
                    .foregroundColor(.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
