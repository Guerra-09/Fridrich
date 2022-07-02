//: A UIKit based Playground for presenting user interface

import Foundation
  
class AlgorithmCreator {

    var algorithmList: [String] = []
    var count: Int = 0
    var newMove: String?
    var reverse: Int?

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
    
}

var test = AlgorithmCreator()
test.getAlgorithm()
