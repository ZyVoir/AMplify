//
//  MainQuestCard.swift
//  AMplify
//
//  Created by William on 26/03/25.
//

import SwiftUI

struct MainQuestCard: View {
    
    @AppStorage("morningRoutinePhase") private var phase : morningRoutinePhase = .none
    
    @StateObject private var locationManager : LocationManager = LocationManager.shared
    
    private var morningRoutineOrder : Int {
        
        return helperFunction.getMorningPhaseOrder(state: phase.rawValue)
    }
    
    
    var colorTop : Color
    var colorBottom : Color
    
    var title : String
    var subtitle : String
    var icon : String

    var transitionText : String

    
    let colorWhite : Color = Color("White")
    let colorGreyPrimary : Color = Color("Grey Primary")
    let colorGreySecondary : Color = Color("Grey Secondary")
    let colorGreyBG : Color = Color("Grey BG")
    
    let colorDarkGreen : Color = Color("Dark Green")
    
    let colorGreenBG : Color = Color("Green BG")
    
    var isCurrentActive : Bool {
        return phase.rawValue == title
    }
    
    var isCompleted : Bool {
        return helperFunction.getMorningPhaseOrder(state: title) < helperFunction.getMorningPhaseOrder(state: phase.rawValue)
    }
    
    var backgroundColor: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: isCurrentActive ?
                               [colorTop, colorBottom] : isCompleted ? [colorGreenBG] : [colorGreyBG]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    @State private var isTransitionComplete : Bool = false
    
    @State private var distanceToAcademy : Int = 0
    
    var body: some View {
        NavigationLink (destination: {
            switch phase {
            case .alarmAndPAA:
                PAAView(isTransitionComplete: $isTransitionComplete)
            case .morningRoutine:
                MorningRoutineView(isTransitionComplete: $isTransitionComplete)
                    
            case .ADA:
                ADAView(isTransitionComplete: $isTransitionComplete)
                    .navigationBarBackButtonHidden()
            default:
                EmptyView()
            }
        }) {
            HStack (alignment: .center, spacing: 20) {

                Image(systemName: isTransitionComplete ? "hand.thumbsup.fill" : icon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .foregroundColor(isCurrentActive ? colorWhite : isCompleted ? colorDarkGreen :  colorGreyPrimary)
                    .padding(.leading, 10)
                

                if isTransitionComplete {
                    VStack {
                        Text(transitionText)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(colorWhite)
                        
                    }.padding(.vertical,20)
                    
                } else {
                    VStack (alignment: .leading) {
                        Text(title)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(isCurrentActive ? colorWhite : isCompleted ? colorDarkGreen : colorGreyPrimary)
                        
                        
                        
                        if isCompleted{
                            Text("\(subtitle)")
                                .font(.system(size: 11, weight: .regular))
                                .lineLimit(nil)
                                .foregroundStyle(colorDarkGreen)
                                .padding(.top, 1)
                                .fixedSize(horizontal: false, vertical: true)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                            
                        }
                        else if title == morningRoutinePhase.ADA.rawValue && isCurrentActive {
                            Text("\(distanceToAcademy) Km away")
                                .font(.system(size: 11, weight: .regular))
                                .lineLimit(nil)
                                .foregroundStyle(colorWhite)
                                .padding(.top, 1)
                                .fixedSize(horizontal: false, vertical: true)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .onChange(of: locationManager.distanceFromAcademy) { oldValue, newValue in
                                    distanceToAcademy = Int(LocationManager.shared.distanceFromAcademy)
                                }
                        }
                        else {
                            HStack (alignment: .center) {
                                Image(systemName: isCurrentActive ? "play.fill" : "lock.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 13, height: 13)
                                
                                
                                Text(isCurrentActive ?  "Do it now" : "Locked" )
                                    .font(.system(size: 13, weight: .medium))
                                
                            }.foregroundColor(isCurrentActive ? colorTop : colorGreyPrimary)
                            
                                .padding(.vertical, 10)
                                .padding(.horizontal, 15)
                                .frame(height: 28)
                                .background(RoundedRectangle(cornerSize: CGSize(width: 40, height: 40)).fill(isCurrentActive ? colorWhite : colorGreySecondary))
                        }
                        
                    }.padding(.vertical, 8)
                }
                

                
                if isCompleted {
                    Image(systemName: "checkmark.square.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18)
                        .padding(.trailing, 1)
                        .foregroundStyle(Color.green)
                }
                else {
                    Spacer()
                }
                
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 115)
            .background(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)).fill(backgroundColor))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(colorGreyPrimary, lineWidth: isCurrentActive ? 0 : 1))
        }
        .disabled(!isCurrentActive)
        .onChange(of: isTransitionComplete) { oldValue, newValue in
            if isCurrentActive && newValue {

                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isTransitionComplete = false
                        
                        switch phase {
                        case .alarmAndPAA:
                            phase = .morningRoutine
                        case .morningRoutine:
                            phase = .ADA
                        case .ADA:
                            phase = .done
                        default: break
                        }
                    }
                }

            }
        }
    }
    
    
}

#Preview {
    HomeView()
}
