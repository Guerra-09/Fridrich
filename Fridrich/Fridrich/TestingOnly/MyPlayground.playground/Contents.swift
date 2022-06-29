//: A UIKit based Playground for presenting user interface

import Foundation
  
// Tienen que ser 20
// DUBLFR

//let time: Date = "04:50"
//
//let date = time.formatted()
//print(date)


class randomAlgorithm {

    var count: Int = 0
    var array: [String] = ["D", "U", "B", "L", "F", "R"]
    var add: String = ""
    var alg: [String] = []



    func generate() {

        while count < 20 {

            let doble: Int = Int.random(in: 1...2)

            if doble == 1 {
                add = array.randomElement() ?? "L"
                alg.append(add)

            } else {
                add = array.randomElement() ?? "L"
                alg.append("2\(add)")
            }



            count+=1

        }

        print(alg)

    }

}

var poto = randomAlgorithm()
poto.generate()
