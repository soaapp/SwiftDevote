//
//  ContentView.swift
//  SwiftDevote
//
//  Created by Jay Jahanzad on 2023-12-29.
//

import Foundation
import SwiftUI
import SwiftData

struct ContentView: View {
    // MARK: - 1. PROPERTIES
    @State var task: String = ""
    @State private var showNewTaskItem: Bool = false
    
    
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        NavigationSplitView {
            ZStack {
                
                // MARK: - MAIN VIEW
                VStack {
                    // MARK: - HEADER
                    
                    HStack(spacing: 10) {
                        // MARK: - TITLE
                        Text("Devote")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.heavy)
                            .padding(.leading, 4)
                        
                        Spacer()
                        
                        // MARK: - EDIT BUTTON
                        
                        EditButton()
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                            .padding(.horizontal, 10)
                            .frame(minWidth: 70, minHeight: 24)
                            .background(Capsule().stroke(.white, lineWidth: 2))
                        
                        // MARK: - APPEARANCE BUTTON
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "moon.circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                        })
                        
                    }//: HSTACK
                    .foregroundColor(.white)
                    
                    Spacer(minLength: 80)
                    
                    // MARK: - NEW TASK BUTTON
                    Button(action: {
                        showNewTaskItem = true
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                        Text("New Task")
                            .font(.system(size: 24, weight: .bold, design: .rounded))
                    })
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .background(LinearGradient(colors: [Color.pink, Color.blue], startPoint: .leading, endPoint: .trailing))
                    .clipShape(Capsule())
                    .shadow(radius: 8)
                    
                    // MARK: - TASKS
                    
                    List {
                        ForEach(items) { item in
                            NavigationLink {
                                VStack(alignment: .leading) {
                                    Text(item.task)
                                        
                                    Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                                        
                                }
                            } label: {
                                VStack(alignment: .leading) {
                                    Text(item.task)
                                        .font(.headline)
                                        .fontWeight(.heavy)
                                    Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                                        .font(.footnote)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }//: LIST
                    .scrollContentBackground(.hidden)
                    .shadow(color: .black.opacity(3), radius: 12)
                    .frame(maxWidth: 640)
                }//: VSTACK
                
                // MARK: - NEW TASK LIST
                
                if showNewTaskItem {
                    BlankView()
                        .onTapGesture {
                            withAnimation() {
                                showNewTaskItem = false
                            }
                        }
                    
                    NewTaskItemView(isShowing: $showNewTaskItem)
                }
                
            }//: ZSTACK
            .navigationBarTitle("Daily Tasks")
            .navigationBarHidden(true)
            ///JJ Fix: Here as well, the tutorial put .background as modifier on the .toolbar{} but that didn't work, it had to be on the ZStack
            .background(BackgroundImageView())
            .background(backgroundGradient)
            
        } detail: {
            Text("Select an item")
        }
        
    }
    
    
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
