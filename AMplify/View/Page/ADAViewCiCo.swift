//
//  ADAViewCiCo.swift
//  AMplify
//
//  Created by Sufi Arifin on 06/04/25.
//


import SwiftUI

struct ADAViewCiCo: View {
    
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
                                Image(systemName: "iphone.badge.location")
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                                    .padding()
                                VStack(alignment: .leading) {
                                    Text("You've arrived at Apple")
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 2)
                                        .padding(.vertical, -10)
                                        .padding(.top, 30)
                                    Text("Developer Academy")
                                        .font(.system(size: 20, weight: .semibold))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 2)
                                        .padding(.vertical, 2)
                                        
                                    Button(action: {
                                                print("Clock In button tapped")
                                            }) {
                                                HStack {
                                                    Image(systemName: "clock.fill")
                                                        .font(.system(size: 20, weight: .regular))
                                                        .foregroundColor(.orange)
                                                    Text("Clock In")
                                                        .font(.system(size: 20, weight: .regular))
                                                        .foregroundColor(.orange)
                                                }
                                                .padding(.horizontal, 15)
                                                .padding(.vertical, 5)
                                                .background(Color.white)
                                                .cornerRadius(30)
                                            }
                                }
                                Spacer()
                            }
                            .padding(.top, 40)
                            .padding(.horizontal, 5)
                            .padding(.bottom, 55)
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
    ADAViewCiCo(isTransitionComplete: .constant(false))
}
