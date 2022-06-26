//
//  TimerView.swift
//  Fridrich
//
//  Created by José Guerra on 26-06-22.
//

import SwiftUI

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






    

struct TimerView: View {
    
    @ObservedObject var timerViewModel = TimerViewModel()
    @State var states: String = ""
    @State var lastTimes: [String] = ["39.7"]
    @State var squareBackground : Color = .red
    
    
    var body: some View {
        
        let longPressDrag = LongPressGesture(minimumDuration: 0.5)
            .onEnded { _ in
                states = "Long press start"
                timerViewModel.recording = true
                timerViewModel.timing = true
                timerViewModel.isRunning = true
            }
            .sequenced(before: DragGesture(minimumDistance: 0))
            .onEnded { _ in
                states = "Long press release"
                timerViewModel.recording = false
                
                
                timerViewModel.start()
                
            }
        
        
        
        
            
        VStack {
            Text(states)
            
    
            
            Text(!(timerViewModel.mode == .stopped) ? String(format: "%.1f", timerViewModel.secondsElapsed) : String(format: "%.1f", timerViewModel.lastTime))
                .frame(width: 300, height: 300)
                .background(timerViewModel.isRunning ? .green :squareBackground)
                .cornerRadius(25)
            
            Text("recording: \(timerViewModel.recording.description) \ntapped: \(timerViewModel.tapped.description)\ntiming: \(timerViewModel.timing.description)")
                .font(.body)
            
            List {
                ForEach(lastTimes, id: \.self){ index in
                    Text("\(index)")
                }
            }
            .padding(.top)
            .padding(.bottom)
            
            
        } // End of Vstack
        
        
        
        
        
        
        .onTapGesture {
            states = "Tapped"
            
            
            //Si el tiempo esta corriendo, para el tiempo y lo agrega a la lista
            if timerViewModel.timing {
                
                timerViewModel.stop()
                timerViewModel.isRunning = false
                timerViewModel.timing = false
                lastTimes.append(String(format: "%.1f", timerViewModel.lastTime))
                
            }
            
            if timerViewModel.isRunning {
                squareBackground = .green
            } else {
                squareBackground = .yellow
            }
            
            timerViewModel.tapped = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                timerViewModel.tapped = false
                squareBackground = .yellow
                squareBackground = .red
            }
            
        }
        .gesture(longPressDrag)
        
    }
}




struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
 
