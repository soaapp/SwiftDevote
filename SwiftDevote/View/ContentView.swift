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
                VStack {
                    
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
                    }
                    .scrollContentBackground(.hidden)
                    .shadow(color: .black.opacity(3), radius: 12)
                    .frame(maxWidth: 640)
                }
            }
            .navigationBarTitle("Daily Tasks")
            .background(backgroundGradient)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
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
