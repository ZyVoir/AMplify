//
//  OnboardingViewPAA.swift
//  AMplify
//
//  Created by Priscilla Anthonio on 27/03/25.
//

import SwiftUI

struct OnboardingViewPAA: View {
    
    @AppStorage("postAlarmActivityMethod") var postAlarmActivityMethod: String = ""
    
    @Binding var onboardingTab : Int
    
    var body: some View {
        ZStack{
            VStack {
                Text("Pick your Post-Alarm Activity 🏃‍♀️")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                HStack{
                    Button {
                        postAlarmActivityMethod = "MathEquation"
                        
                        withAnimation {
                            onboardingTab += 1
                        }
                    } label : {
                        Image("PAA1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 143, height:143)
                            .padding(.bottom, 20)
                            .shadow(radius: 20)
                    }
                    
                    Button {
                        
                    } label : {
                        Image("PAA2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 143, height:143)
                            .padding(.bottom, 20)
                            .shadow(radius: 20)
                    }
                    
                    
                }
                HStack{
                    
                    Button {
                        
                    } label : {
                        Image("PAA3")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 143, height:143)
                            .padding(.bottom, 20)
                            .shadow(radius: 20)
                    }
                    
                    
                    
                    Button {
                        
                    } label : {
                        Image("PAA4")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 143, height:143)
                            .padding(.bottom, 20)
                            .shadow(radius: 10)
                    }
                    
                }
                HStack{
                    
                    Button {
                        
                    } label : {
                        Image("PAA5")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 143, height:143)
                            .padding(.bottom, 20)
                            .shadow(radius: 10)
                    }
                    
                    Button {
                        
                    } label : {
                        Image("PAA6")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 143, height:143)
                            .padding(.bottom, 20)
                            .shadow(radius: 10)
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    OnboardingViewPAA(onboardingTab: .constant(3))
}
