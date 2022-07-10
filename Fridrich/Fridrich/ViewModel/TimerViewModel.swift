//
//  TimerViewModel.swift
//  Fridrich
//
//  Created by José Guerra on 28-06-22.
//

import Foundation

class TimerViewModel: ObservableObject {
    
    @Published var timeElapsedFormatted = "00:00.00"
    @Published var mode: stopWatchMode = .stopped

    var secondsElapsed = 0.0
    var completedSecondsElapsed = 0.0
    var timer = Timer()
    

    func start() {
        self.mode = .timing
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
        self.secondsElapsed += 0.01
        self.formatTime()
        }
        
    }
    

    func stop() {

        timer.invalidate()
        self.mode = .stopped
        self.completedSecondsElapsed = self.secondsElapsed
        self.secondsElapsed = 0.0
        self.timeElapsedFormatted = "00:00.00"

    }
    
    func formatTime() {
    
        let minutes: Int32 = Int32(self.secondsElapsed/60)
        let minutesString = (minutes < 1) ? "0" : "\(minutes)"
        
        let seconds: Int32 = Int32(self.secondsElapsed) - (minutes * 60)
        let secondsString = (seconds < 1) ? "0" : "\(seconds)"
        
        let milliseconds: Int32 = Int32(self.secondsElapsed.truncatingRemainder(dividingBy: 1) * 100)
        let millisecondsString = (milliseconds < 10) ? "0" : "\(milliseconds)"

        self.timeElapsedFormatted = minutesString + ":" + secondsString + "." + millisecondsString
    }
    

    

    enum stopWatchMode {
        case timing
        case stopped
    }
}
