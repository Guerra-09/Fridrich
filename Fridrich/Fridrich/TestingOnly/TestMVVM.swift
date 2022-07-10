//
//  TestMVVM.swift
//  Fridrich
//
//  Created by José Guerra on 09-07-22.
//

import SwiftUI

class timerTest: ObservableObject {
    
    @Published var timeElapsed: Double = 0.0
    @Published var tMode: tStopWatchMode = .stopped
    @Published var lastTimeRecorded: Double = 0.0
    
    var startingTime = Timer()
    
    func startTime() {
        
        
        if tMode == .stopped {
            
            tMode = .running
            startingTime = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                self.timeElapsed += 0.1 }
            
        } else {
            
            startingTime.invalidate()
            tMode = .stopped
            self.lastTimeRecorded = self.timeElapsed
            
        }
        
        
    }
    
    func getFormatter() -> String {
        
        var poto: String
        poto = "\(String(format: "%.1f", self.timeElapsed))"
        return poto

        
    }
    
    
    
    enum tStopWatchMode {
        case running, stopped
    }
    
}




struct TestMVVM: View {
    
    @ObservedObject var tTime = timerTest()
    
    // Triggers
    @State var runningProgram: Bool = false

    
    var body: some View {
        
        VStack {
            
            Text(tTime.tMode == .running ? "\(tTime.getFormatter())" : "\(tTime.lastTimeRecorded)")
            
            
            
            
            
            Button {
                
                tTime.startTime()
                

            } label: {
                Text("Iniciar/Parar")
                    .frame(width: 100, height: 100)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(15)
            }

        }
        
        
    }
}



struct TestMVVM_Previews: PreviewProvider {
    static var previews: some View {
        TestMVVM()
    }
}
