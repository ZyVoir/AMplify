//
//  OnboardingViewDifficulty.swift
//  AMplify
//
//  Created by Sufi Arifin on 26/03/25.
//

import SwiftUI

struct OnboardingViewDifficulty: View {
    
    @Binding var onboardingTab : Int
    
    @AppStorage("postAlarmActivityDifficulty") var activityDifficulty: String = ""
    
    @State private var selectedDifficulty: String = "Easy"
    let difficulties = ["Easy", "Medium", "Hard"]
    
    var body: some View {
        VStack (alignment: .leading) {
            Spacer()
            Text("Select difficulty")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 5)
                .padding(20)
            VStack {
                Image("TypedMath")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 280, height: 280)
                    .padding(.horizontal, 35)
                    .padding(.bottom, 20)
                    .shadow(color: Color("Black"), radius: 10, x: 0, y: 10)
            }
            ForEach(difficulties, id: \..self) { difficulty in
                HStack {
                    Image(systemName: selectedDifficulty == difficulty ? "largecircle.fill.circle" : "circle")
                        .foregroundColor(Color("TealNormal"))
                    Text(difficulty)
                        .font(.body)
                        .foregroundColor(.black)
                }
                .padding(.vertical, 0)
                .padding(.horizontal, 35)
                .onTapGesture {
                    selectedDifficulty = difficulty
                }
         
            }
            .padding(.top, 10)
           
            Button(action: {
                print("Selected difficulty: \(selectedDifficulty)")
                
                activityDifficulty = selectedDifficulty
                
                withAnimation {
                    onboardingTab += 1
                }
            }) {
                HStack {
                    Text("Continue")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("TealNormal"))
                .cornerRadius(10)
            }
            .padding(.top, 100)
            .padding(.horizontal, 10)
            
            Spacer()
        }
        .padding(20)
    }
}


#Preview {
    OnboardingViewDifficulty(onboardingTab: .constant(4))
}
