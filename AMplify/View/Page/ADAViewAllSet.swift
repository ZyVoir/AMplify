//
//  ADAViewAllSet.swift
//  AMplify
//
//  Created by Sufi Arifin on 07/04/25.
//

import SwiftUI

struct ADAViewAllSet: View {
    
    @Binding var isTransitionComplete: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
                VStack {
                    Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                            .padding(.leading, 310)
                            .padding(.top, -10)
                            .padding(.bottom, 30)

                    HStack {
                        Text("Good Morning, Willy")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.leading, -85)

                    }
                    ZStack {
                        Image("CarouselBackground")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 180)
                            .cornerRadius(20)
                            .overlay(
                                Text("The best way to get\nsomething **done** is to **begin**")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(),alignment: .center
                            )
                    }
                    .padding(.top, -5)
                    .padding(.horizontal)
                    
                    HStack(spacing: 10) {
                        Circle().fill(Color.gray.opacity(0.5)).frame(width: 8, height: 8)
                        Circle().fill(Color.black).frame(width: 8, height: 8)
                        Circle().fill(Color.gray.opacity(0.5)).frame(width: 8, height: 8)
                    }
                    .padding(.top, 15)
                    .padding(.horizontal, 180)
                    
                    Text("Your Daily Quest 🎯")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.leading, -150)
                        .padding(.top, 15)
                        .padding(.horizontal, 20)
                    
                    VStack(spacing: 15) {
                        
                        TaskCard(icon: "calendar.badge.clock",
                                     title: "Do Post Alarm Activity", description: "It's a new day, fresh start, fresh energy, new opportunities.", completed: true)
                            
                        TaskCard(icon: "cloud.sun.fill", title: "Complete Morning Routine", description: "Boost your energy and productivity today!", completed: true)
                        
                        NavigationLink(destination: Text("Apple Developer Academy")) {
                            HStack {
                                Image(systemName: "hand.thumbsup.circle")
                                    .font(.system(size: 55, weight: .regular))
                                    .foregroundColor(.white)
                                    .symbolEffect(.breathe)
                                    .padding()
                                VStack(alignment: .leading) {
                                    Text("All set for today, Willy!")
                                        .font(.system(size: 23, weight: .semibold))
                                        .foregroundColor(.white)
                                        .padding(-8)
                                }
                                Spacer()
                            }
                            .padding(.top, 50)
                            .padding(.bottom, 50)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                            .frame(width: 370, height: 130)
                            .cornerRadius(15)
                        }
                    
                    }
                    
                }
                .padding(.top, -20)
            }
        }

#Preview {
    ADAViewAllSet(isTransitionComplete: .constant(false))
}
