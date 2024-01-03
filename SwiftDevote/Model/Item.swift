//
//  Item.swift
//  SwiftDevote
//
//  Created by Jay Jahanzad on 2023-12-29.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    var completion: Bool
    var task: String
    var id: UUID
    
    init(timestamp: Date, completion: Bool, task: String) {
        self.timestamp = timestamp
        self.completion = completion
        self.task = task
        self.id = UUID()
        
    }
}
