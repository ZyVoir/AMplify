//
//  PAAView.swift
//  AMplify
//
//  Created by William on 29/03/25.
//

import SwiftUI

struct PAAView: View {
    
    @State private var answer: String = ""
    
//    @FocusState private var isFocused: Bool
    @Binding var isTransitionComplete: Bool

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Image("Alarm PAA BG")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(edges: .all)
            VStack{
                Text("12x10+13-9/3 = ?")
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
                    dismiss()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation {
                            isTransitionComplete = true
                        }
                    }
                } label : {
                    if answer == "130" {
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

            }
            
        }


    }
}

#Preview {
    HomeView()
}
