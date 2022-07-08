//
//  TimerViewModel.swift
//  Fridrich
//
//  Created by José Guerra on 28-06-22.
//

import Foundation

class TimerViewModel: ObservableObject {

    @Published var recording = false
    @Published var tapped = false
    @Published var timing = false
    @Published var isRunning: Bool = false
    
    @Published var secondsElapsed = 0
    @Published var secondsLastTime = 0
    @Published var timeFormatter: String = "0"
    
    
    @Published var mode: stopWatchMode = .stopped
    
    
    var timerSeconds = Timer()
    var timerMiliSeconds = Timer()


    func start() {
        
        
        mode = .running
        if self.timing {
            timerSeconds = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                self.secondsElapsed += 1 }
        }
        
        self.timeFormatter = "\(self.secondsElapsed)"
    }
    

    func stop() {

        timerSeconds.invalidate()
        secondsLastTime = secondsElapsed
        secondsElapsed = 0
        
        mode = .stopped

    }
    

    

    enum stopWatchMode {
        case running, stopped, pause
    }
}
