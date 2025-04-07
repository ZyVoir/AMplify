//
//  HomeView.swift
//  AMplify
//
//  Created by William on 24/03/25.
//


import SwiftUI

struct HomeView: View {
    
    @AppStorage("isOnboarding") private var isOnboarding: Bool = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                Background(color: "White")
                
                VStack (alignment: .leading) {
                    
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
                    .padding(.bottom, 20)
                    
                    HomeHeader()
                        .padding(.bottom, 35)
                    
                    
                    MainQuestList()
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 25)
                .padding(.vertical, 15)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("White"))
                
            }
        }.onAppear{
            if !(LocationManager.shared.authorizationStatus == .authorizedAlways || LocationManager.shared.authorizationStatus == .authorizedWhenInUse) && !isOnboarding {
                LocationManager.shared.requestPermission()
            }
        }
    }
}

struct HomeHeader : View {
    
    @AppStorage("isOnboarding") private var isOnboarding: Bool = true
    
    @AppStorage("morningRoutinePhase") private var morningRoutinePhase : morningRoutinePhase = .none
    
    let morningRoutinePhases : [morningRoutinePhase] = [.none, .alarmAndPAA, .morningRoutine, .ADA, .done]
    
    // TODO: Change the value of this array
    let carouselItems : [String] = ["Carousel_1", "Carousel_1"]
    
    @State var currentShowingTab : Int = 0
    
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()

    @State var index : Int = 0
    
    @AppStorage("username") private var username : String = ""
   
    var body: some View {
        VStack (alignment: .leading) {
            
            Text(isOnboarding ? "Home" : "Good Morning, \(username)!")
                .font(.system(size: 28, weight: .bold, design: .default))
                .padding(.bottom,17)
                .foregroundStyle(Color("Black"))
                .onTapGesture {
                    morningRoutinePhase = morningRoutinePhases[index]
                    
                    index = (index + 1) % morningRoutinePhases.count
                }
            
            
            
            if !isOnboarding {
                // TODO : Implement Carousel
                TabView(selection: $currentShowingTab) {
                    ForEach(carouselItems.indices, id: \.self) { i in
                        Button {
                            
                        } label : {
                            Image(carouselItems[i])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)
                                .padding(.horizontal, 5)
                        }
                    }
                }.tabViewStyle(.page(indexDisplayMode: .always))
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                    .onReceive(timer) { _ in
                                withAnimation {
                                    currentShowingTab = (currentShowingTab + 1) % carouselItems.count // Loops back after last tab
                                }
                            }
                
            }
            else {
                NavigationLink(destination: OnboardingView()){
                    Image("CarouselOnboard")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                }
                
                
            }
            
        }
    }
}

struct MainQuestList : View {
    
    @AppStorage("username") private var username : String = ""
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Your Daily Quest 🎯")
                .font(.system(size: 22, weight: .bold, design: .default))
                .padding(.bottom,17)
            
            VStack (spacing : 16){
                MainQuestCard(
                    colorTop: Color("Light Blue Gradient 1"),
                    colorBottom: Color("Light Blue Gradient 2"),
                    title: morningRoutinePhase.alarmAndPAA.rawValue,
                    subtitle: "It's a new day, fresh start, fresh energy, new opportunities.",
                    icon: "equal.square.fill",
                    transitionText: "Great, \(username)!"
                )
                
                MainQuestCard(
                    colorTop: Color("Primary Dark Gradient 1"),
                    colorBottom: Color("Primary Dark Gradient 2"),
                    title: morningRoutinePhase.morningRoutine.rawValue,
                    subtitle: "Boost your energy and productivity today!",
                    icon: "cloud.sun.fill",
                    transitionText: "Keep Going, \(username)!"
                )
                
                MainQuestCard(
                    colorTop: Color("Orange Gradient 1"),
                    colorBottom: Color("Orange Gradient 2"),
                    title: morningRoutinePhase.ADA.rawValue,
                    subtitle: "You're All Set!",
                    icon: "mappin.and.ellipse",
                    transitionText: "All set for today, \(username)!"
                )
            }
            
            
            
        }
        
    }
}

#Preview {
    HomeView()
}
