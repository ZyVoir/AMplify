//
//  OnboardingViewPAA.swift
//  AMplify
//
//  Created by Priscilla Anthonio on 27/03/25.
//

import SwiftUI

struct OnboardingViewPAA: View {
    var body: some View {
        ZStack{
            VStack {
                Text("Pick your Post-Alarm Activity 🏃‍♀️")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                HStack{
                    Image("PAA1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 143, height:143)
                        .padding(.bottom, 20)
                        .shadow(radius: 20)
                                    
                    
                    Image("PAA2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 143, height:143)
                        .padding(.bottom, 20)
                        .shadow(radius: 20)
                    
                
                }
                HStack{
                    Image("PAA3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 143, height:143)
                        .padding(.bottom, 20)
                        .shadow(radius: 20)
                                    
                    
                    Image("PAA4")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 143, height:143)
                        .padding(.bottom, 20)
                        .shadow(radius: 10)
                }
                HStack{
                    Image("PAA5")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 143, height:143)
                        .padding(.bottom, 20)
                        .shadow(radius: 10)
                                    
                    
                    Image("PAA6")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 143, height:143)
                        .padding(.bottom, 20)
                        .shadow(radius: 10)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    OnboardingViewPAA()
}
