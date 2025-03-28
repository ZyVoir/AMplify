//
//  RepeatView.swift
//  AMplify
//
//  Created by Priscilla Anthonio on 27/03/25.
//

import SwiftUI

struct RepeatView: View {
    
    @State private var selectedDays: Set<String> = []
    let daysOfWeek = ["Every Sunday", "Every Monday", "Every Tuesday", "Every Wednesday", "Every Thursday", "Every Friday", "Every Saturday"]
    
    var body: some View {
        
        NavigationStack {
                    List {
                        ForEach(daysOfWeek, id: \.self) { day in
                            HStack {
                                Text(day)
                                Spacer()
                                if selectedDays.contains(day) {
                                    Image(systemName: "checkmark.circle.fill") // Selected icon
                                        .foregroundStyle(Color.teal)
                                } else {
                                    Image(systemName: "circle") // Unselected icon
                                        .foregroundStyle(Color.gray)
                                    
                                }
                            }
                            .contentShape(Rectangle()) // Makes the whole row tappable
                                                .onTapGesture {
                                                    if selectedDays.contains(day) {
                                                        selectedDays.remove(day)
                                                    } else {
                                                        selectedDays.insert(day)
                                                    }
                                                }
                                            }
                                        }
                                        .navigationTitle("Repeat")
        

//                    .toolbar{
//                        ToolbarItem(placement: .navigationBarLeading){
//                            Button(action : {
//                                presentationMode.wrappedValue.dismiss()
//                            }){
//                                Image(systemName: "chevron.left")
//                                    .foregroundStyle(Color.blue)
//                            }
//                        }
//                    }
                .listRowBackground(Color.lightGreyList)
                   
            .scrollContentBackground(.hidden)
        }
        
    }
}

#Preview {
    RepeatView()
}
