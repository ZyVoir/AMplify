//
//  MorningRoutineView.swift
//  AMplify
//
//  Created by William on 29/03/25.
//

import SwiftUI

struct MorningRoutineView: View {
    
    @Binding var isTransitionComplete: Bool
    
    @Environment(\.dismiss) var dismiss
    
    @AppStorage("morningRoutineEndTime") var morningRoutineEndTime: String = ""
    
    var MREdntTime: Date {
        let components = morningRoutineEndTime.split(separator: ":").compactMap { Int($0) }
        guard components.count == 3 else { return Date() }

        let calendar = Calendar.current
        var dateComponents = calendar.dateComponents([.year, .month, .day], from: Date())
        dateComponents.hour = components[0]
        dateComponents.minute = components[1]
        dateComponents.second = components[2]

        return calendar.date(from: dateComponents) ?? Date()
    }

    var safeCountdownRange: ClosedRange<Date> {
        let now = Date()
        return now...(MREdntTime > now ? MREdntTime : now)
    }

    
    var body: some View {
        ZStack {
            Image("MRViewBG")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack (spacing: 30) {
                Text("Do Your Morning\n Routine! 🌤️")
                    .font(.system(size: 28, weight: .bold, design: .default))
                    .foregroundStyle(.white)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
                
                Text(timerInterval: safeCountdownRange, countsDown: true).font(.system(size: 109, weight: .bold, design: .default)).foregroundStyle(.white)
                
                Button {
                    dismiss()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation {
                            isTransitionComplete = true
                        }
                    }
                } label : {
                    HStack{
                        Text("Continue")
                            .font(.headline)
                        Image(systemName: "arrow.right")
                    }
                    .frame(width: 350, height: 50)
                    .background(Color.teal)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.top, 30)
                }
            }.padding()
        }
    }
}

#Preview {
    MorningRoutineView(isTransitionComplete: .constant(false))
}
