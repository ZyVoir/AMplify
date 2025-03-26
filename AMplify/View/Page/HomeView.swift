//
//  HomeView.swift
//  AMplify
//
//  Created by William on 24/03/25.
//


import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Background(color: "White")
                
                VStack {
                    HStack {
                        Spacer()
                        
                        NavigationLink(destination: ProfileView()) {
                            Image(systemName: "person.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 27, height: 27)
                                .foregroundColor(Color("Black"))
                        }
                        .toolbarColorScheme(.dark, for: .navigationBar)
                    }
                    .padding(.bottom, 28)
                    
                    Home()
                    
                    MainQuest()
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 30)
                .padding(.vertical,15)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("White"))
                
            }
        }
    }
}

struct Home : View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("Home")
                .font(.system(size: 28, weight: .bold, design: .default))
                .padding(.bottom,17)
            
            NavigationLink(destination: OnboardingView()){
                Image("CarouselOnboard")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: .infinity)
            }
            
            
                
            Spacer()
        }
    }
}

struct MainQuest : View {
    var body: some View {
        VStack (alignment: .leading) {
            Text("Your Daily Quest 🎯")
        }
    }
}

#Preview {
    HomeView()
}
