//
//  TimerViewModel.swift
//  Fridrich
//
//  Created by José Guerra on 28-06-22.
//

import Foundation

class TimerViewModel: ObservableObject {

    @Published var secondsElapsed = 0.0
    @Published var recording = false
    @Published var tapped = false
    @Published var timing = false
    @Published var isRunning: Bool = false
    @Published var lastTime: Double = 0.0
    @Published var mode: stopWatchMode = .stopped
    
    
    var timer = Timer()


    func start() {
        mode = .running
        if self.timing {
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                self.secondsElapsed += 0.1 }
        }
    }
    

    func stop() {

        timer.invalidate()
        lastTime = secondsElapsed
        secondsElapsed = 0
        mode = .stopped

    }
    

    enum stopWatchMode {
        case running, stopped, pause
    }
}
