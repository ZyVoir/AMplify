//
//  ProfileView.swift
//  AMplify
//
//  Created by William on 26/03/25.
//

import SwiftUI

struct ProfileView: View {
    
    @AppStorage("StreakCount") var streakCount: Int = 0
    
    var body: some View {
        ZStack {
            Image("ProfileView_background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
                .frame(width: 410, height: 875)
            
            VStack(spacing: 20) {
                //                HStack {
                //                    Button(action: {
                //                        // Aksi tombol Back
                //                    }) {
                //                        HStack {
                //                            Image(systemName: "chevron.left")
                //                                .foregroundColor(.white)
                //                            Text("Back")
                //                                .foregroundColor(.white)
                //                        }
                //                    }
                //                    .padding(.vertical, 10)
                //                    Spacer()
                //                }
                //                .padding(.horizontal)
                Spacer()
                VStack {
                    HStack {
                        Text(String(streakCount))
                            .font(.system(size: 50, weight: .black))
                            .foregroundColor(.white)
                            .padding(.horizontal, -160)
                            .padding(.vertical, 50)
                        Image("Fire_forStreak")
                            .resizable()
                            .frame(width: 47, height: 62)
                            .padding(.horizontal, -140)
                    }
                    Text("day streak!")
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundColor(.white)
                        .padding(.horizontal, -160)
                        .padding(.vertical, -60)
                }
                
                Button(action: {
                    // Aksi tombol View Streak Calendar
                }) {
                    HStack {
                        Text("View Streak Calendar")
                            .font(.system(size: 20, weight: .semibold))
                        Image(systemName: "arrow.right")
                            .font(.system(size: 20, weight: .semibold))
                    }
                    .padding()
                    .padding(.horizontal, 50)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .padding(.top, -40)
                }.padding(.top,15)
                
                VStack(alignment: .leading) {
                    Text("Alarm Settings")
                        .font(.headline)
                        .padding(.top, 40)
                        .padding(.horizontal, 20)
                        .padding(.bottom, -30)
                    
                    List {
                        HStack {
                            Image(systemName: "clock")
                            Text("Edit Alarm")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        HStack {
                            Image(systemName: "waveform.path.ecg")
                            Text("Edit Post-Alarm Activity")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        HStack {
                            Image(systemName: "sun.max")
                            Text("Edit Morning Routine Duration")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                    .scrollDisabled(true)
                    .scrollContentBackground(.hidden)
                    .listStyle(InsetGroupedListStyle())
                    .padding(.vertical, -5)
                    .padding(.horizontal, -15)
                }
                
                VStack(alignment: .leading) {
                    Text("Help Center")
                        .font(.headline)
                        .padding(.top, -30)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 5)
                    
                    List {
                        HStack {
                            Image(systemName: "iphone.and.arrow.right.inward")
                            Text("Sign In")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        HStack {
                            Image(systemName: "text.bubble")
                            Text("Contact us")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        HStack {
                            Image(systemName: "questionmark.circle")
                            Text("Help Center")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                    }
                    .scrollDisabled(true)
                    .scrollContentBackground(.hidden)
                    .listStyle(InsetGroupedListStyle())
                    .padding(.vertical, -50)
                    .padding(.horizontal, -15)
                }
            }
            .padding()
        }
    }
}


#Preview {
    ProfileView()
}
