//
//  PAAView.swift
//  AMplify
//
//  Created by William on 29/03/25.
//

import SwiftUI
import Foundation

enum DifficultyLevel {
    case none
    case easy
    case medium
    case hard
}


struct PAAView: View {
    
    @State private var answer: String = ""
    
//    @FocusState private var isFocused: Bool
    @Binding var isTransitionComplete: Bool

    @Environment(\.dismiss) var dismiss
    @AppStorage("postAlarmActivityDifficulty") var activityDifficulty: String = ""

    // setiap dia buka PAA bkln run ini, trus bkln kasih random equation
    //dari string di decompose ulang, buat resultnya

    func getPredefinedEquation(for difficulty: DifficultyLevel) -> (equation: String, result: Int) {
        
        let equations: [DifficultyLevel: [(String, Int)]] = [
                .easy: [
                    ("2 + 3", 5), ("7 - 4", 3), ("5 + 5", 10), ("6 - 1", 5),
                    ("9 + 1", 10), ("10 - 3", 7), ("4 + 4", 8), ("8 - 2", 6),
                    ("3 + 6", 9), ("7 - 2", 5), ("6 + 3", 9), ("10 - 6", 4),
                    ("2 * 2", 4), ("8 / 2", 4), ("3 * 3", 9), ("9 / 3", 3),
                    ("4 + 5", 9), ("6 + 4", 10), ("10 / 2", 5), ("2 * 4", 8)
                ],
                .medium: [
                    ("(3 + 5) * 2", 16), ("18 - (6 / 2)", 15), ("4 * 5", 20), ("12 / 3", 4),
                    ("(6 + 2) * 2", 16), ("20 - (8 / 4)", 18), ("5 * 3", 15), ("14 / 2", 7),
                    ("(9 - 3) * 2", 12), ("24 / 3", 8), ("2 * 6", 12), ("10 + (4 * 2)", 18),
                    ("(7 - 2) * 3", 15), ("28 / 4", 7), ("6 * 2", 12), ("30 / 5", 6),
                    ("(8 + 2) * 1", 10), ("(15 - 5) / 2", 5), ("(3 + 3) * 3", 18), ("(20 / 2) + 5", 15)
                ],
                .hard: [
                    ("(10 + 2) * (3 - 1)", 24), ("(8 * 2) + 4", 20), ("36 / (3 + 3)", 6), ("(9 + 1) / 2", 5),
                    ("(4 + 6) * (2 + 1)", 30), ("(18 - 6) / 2", 6), ("(5 * 4) + (3 * 2)", 26), ("(25 / 5) * 2", 10),
                    ("(14 - 4) * 2", 20), ("(8 + 8) / 4", 4), ("(9 * 3) - 6", 21), ("(36 / 6) + 5", 11),
                    ("(7 + 5) * (2 + 1)", 36), ("48 / (3 * 2)", 8), ("(12 + 8) / 2", 10), ("(16 - 4) + (3 * 2)", 18),
                    ("(6 * 2) + (10 / 5)", 14), ("(8 * 3) - 4", 20), ("(9 + 6) / 3", 5), ("(30 / 5) * 3", 18)
                ]
            ]

        if let questions = equations[difficulty], !questions.isEmpty {
            return questions.randomElement()!
        } else {
            return ("0 + 0", 0) // fallback
        }
    }
    
    @State private var equation: String = ""
    @State private var result: Int = 0
    
        
    var body: some View {
        ZStack{
            Image("Alarm PAA BG")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(edges: .all)
            VStack{
                // bikin algo dimana dia ngembaliin 2 hal, equationnya sama jawaban dari equation
                // setiap kali buka kita generate aja 1, klo buka appnya regenerate yg baru.
                // ONappear
                // resultnya dimasukin ke variable
                Text("\(equation)")
                
              
                    .font(.system(size: 38.19, weight: .medium))
                    .foregroundColor(.white)
              
                TextField("Type your answer", text: $answer)
                    .keyboardType(.numberPad)
                    .padding(15)
                    .background(.opacity(0.1))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 10)
//                    .focused($isFocused)
                    .padding(.bottom,30)
                Button {
                    SoundManager.shared.stopSound()
                    dismiss()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation {
                            isTransitionComplete = true
                        }
                    }
                } label : {
                    if Int(answer) == result {
                        HStack {
                            Text("Continue")
                            Image(systemName: "arrow.right")
                        }
                            .frame(width: 350, height: 50)
                            .background(Color.teal)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    } else {
                        Label("Continue", systemImage: "lock.fill")
                            .foregroundStyle(.primary)
                            .frame(width: 350, height: 50)
                            .background(Color.greyDisabled)
                            .foregroundColor(.gray)
                            .cornerRadius(12)
                    }
                }
                .disabled(Int(answer) != result)

            }
            
        }.onAppear{
            //when the z stack appears on the foreground which mena the whole screen appears, kita mau functionnya ngerun, trus equation result dimasukin ke variable tampungan tadi. si equation & result yg bakalan dipake di ui.
            var difficulty : DifficultyLevel = .none
            
            switch activityDifficulty{
                case "Easy":
                difficulty = .easy
                case "Medium":
                difficulty = .medium
                case "Hard":
                difficulty = .hard
            default:
                // set difficulty jadi 1,2 aja
                difficulty = .easy
            }
            
            let res = getPredefinedEquation(for: difficulty)
            
             
            equation = res.equation
            result = res.result
            
            print(equation)
            print(result)
        }
   


    }
}

#Preview {
    HomeView()
}
