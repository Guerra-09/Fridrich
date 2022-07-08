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

