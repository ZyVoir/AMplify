//
//  ADAView.swift
//  AMplify
//
//  Created by William on 29/03/25.
//

import SwiftUI

struct ADAView: View {
    
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
                                    Text("Arrive at Apple Developer Academy")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .padding(-8)
                                    Text("15 km away!")
                                        .font(.headline)
                                        .foregroundColor(.white.opacity(0.8))
                                        .padding(.vertical, 5)
                                        .padding(.horizontal, -8)
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

        // Reusable Task Card Component
        struct TaskCard: View {
            var icon: String
            var title: String
            var description: String
            var completed: Bool
            
            var body: some View {
                HStack {
                    Image(systemName: icon)
                        .font(.title)
                        .foregroundColor(.green)
                    
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.headline)
                        Text(description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    if completed {
                        Image(systemName: "checkmark.square.fill")
                            .foregroundColor(.green)
                            .font(.title)
                    }
                }
                .padding()
                .background(Color.green.opacity(0.1))
                .cornerRadius(12)
                .padding(.horizontal)
            }
        }

#Preview {
    ADAView(isTransitionComplete: .constant(false))
}
