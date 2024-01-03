//
//  NewTaskItemView.swift
//  SwiftDevote
//
//  Created by Jay Jahanzad on 2024-01-03.
//

import SwiftUI

struct NewTaskItemView: View {
    // MARK: - PROPERTIES
    @Environment(\.modelContext) private var modelContext
    
    @State private var task: String = ""
    
    @Binding var isShowing: Bool
    
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    
    // MARK: - FUNCTIONS
    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date(), completion: false, task: task)
            modelContext.insert(newItem)
        }
        
        task = ""
        isShowing = false
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                TextField("New Task", text: $task)
                    .foregroundColor(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                
                Button(action: {
                    addItem()
                }, label: {
                    Spacer()
                    Text("SAVE")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                })
                .disabled(isButtonDisabled)
                .padding()
                .font(.headline)
                .foregroundColor(.white)
                .background(isButtonDisabled ? .blue : .pink)
                .cornerRadius(10)
                
            }//: VSTACK
            .padding(.horizontal)
            .padding(.vertical, 30)
            .background(.white)
            .cornerRadius(13)
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 24)
            .frame(maxWidth: 640)
            
        }//: VSTACK #2
        .padding(.horizontal)
        .padding(.vertical, 30)
        
    }
    
}

#Preview {
    NewTaskItemView(isShowing: .constant(true))
        .background(.gray).ignoresSafeArea(.all)
}
