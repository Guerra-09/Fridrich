//
//  scrambleGenerator.swift
//  Fridrich
//
//  Created by José Guerra on 01-07-22.
//

import Foundation

func getAlgorithm() -> [String] {
 
    
    var algorithm: [String] = []
    let moves = ["L", "R", "F", "U", "B", "D"]
    var last = ""
    var posibilities: [String] = []

    for _ in 1...20 {
        
        posibilities = []
        var move = moves.randomElement()!
            
        while move == last {
          move = moves.randomElement()!
        }
            
        posibilities.append(contentsOf: ["\(move)", "\(move)*", "2\(move)"])
        algorithm.append(posibilities.randomElement()!)
        last = move
        
    }

 
    

  return algorithm
  
}
