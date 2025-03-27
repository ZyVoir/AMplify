//
//  OnboardingViewName.swift
//  AMplify
//
//  Created by Sufi Arifin on 26/03/25.
//

import SwiftUI

struct OnboardingViewName: View {
    @State private var name: String = ""
    var body: some View {
        ZStack {
            Image("1 - OnboardingViewName")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(edges: .all)
            VStack {
                Spacer()
                VStack (alignment: .leading){
                   
                        Text("Hi, there!")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.bottom,5)
                        Text("Tell us your name..")
                            .font(.title)
                            .foregroundColor(.white.opacity(0.8))
                            .padding(.bottom,20)
                        TextField("Enter your name", text: $name)
                            .padding(15)
                            .background(.opacity(0.3))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 0)
                    
                }
                .padding(40)
                
                Button(action: {}) {
                    HStack {
                        Text("Continue")
                        Image(systemName: "arrow.right")
                    }
                    .padding(15)
                    .frame(maxWidth: .infinity)
                    .background(Color("Teal"))
                    .foregroundColor(Color("TealDark"))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                }
                .padding(.top, 20)
                Spacer()
                Spacer()
                HStack {
                    ForEach(0..<5) {index in Circle()
                            .fill(index == 0 ? Color.white : Color.gray)
                            .frame(width: 10, height: 10)
                    }
                }
                .padding(.bottom, 45)
            }
        }
    }
    
}


#Preview {
    OnboardingViewName()
}
