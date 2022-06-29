//
//  TimesSaved.swift
//  Fridrich
//
//  Created by José Guerra on 28-06-22.
//

import Foundation

struct TimeRecorded: Identifiable {
    
    let id: String
    let time: String
    
    init(id: String, time: String) {
        
        self.id = id
        self.time = time
        
    }
        
}



//Immutable struct

//struct ItemModel: Identifiable, Codable {
//
//    let id: String
//    let title: String
//    let isCompleted: Bool
//
//    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
//
//        self.id = id
//        self.title = title
//        self.isCompleted = isCompleted
//    }
//
//    func updateCompletion() -> ItemModel {
//        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
//    }
//
//}
