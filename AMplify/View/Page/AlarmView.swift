//
//  AlarmView.swift
//  AMplify
//
//  Created by Priscilla Anthonio on 02/04/25.
//

import SwiftUI

struct AlarmView: View {
    
    
    var body: some View {
        ZStack{
            Image("Alarm PAA BG")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(edges: .all)
            
            VStack{
                Text("Bangun Woy!")
                .font(.largeTitle)
                .foregroundColor(.white)
                .fontWeight(.bold)
                
                .padding(.bottom,5)
                
                HStack(alignment: .top){
                    Text("7:00")
                        .foregroundColor(.white)
                        .font(.system(size: 119.41, weight: .medium))
 
                    Text("AM")
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    print("Placeholder")
                }) {
                    HStack{
                        Text("Continue")
                            .font(.headline)
                        Image(systemName: "arrow.right")
                    }

                        .frame(width: 350, height: 50)
                        .background(Color.teal)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    
                }
            }
        }

        
    }
}

#Preview {
    AlarmView()
}
