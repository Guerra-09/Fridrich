//
//  TimerView.swift
//  Fridrich
//
//  Created by José Guerra on 26-06-22.
//

import SwiftUI




struct TimerView: View {
    
    @ObservedObject var timerViewModel = TimerViewModel()
    @State var states: String = ""
    @State var lastTimes: [String] = ["Tiempos"]
    @State var squareBackground : Color = .red
    
    
    
    
    var body: some View {
        
        var timeInSeconds = String(format: "%.1f", timerViewModel.secondsElapsed)
        
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
            // States: just to see what the user it's doing
            Text(states)
            
                        
//             String(format: %.1f) should be changed for DateFormat
            if Double(timeInSeconds) == 60.0 {
                
                
                
            } else {
                
                Text(!(timerViewModel.mode == .stopped) ?
                        String(format: "%.1f",timerViewModel.secondsElapsed) :
                        String(format: "%.1f", timerViewModel.lastTime))
                    .font(.custom("", size: 70))
                    .frame(width: 300, height: 300)
                    .background(timerViewModel.isRunning ? .green :squareBackground)
                    .cornerRadius(25)
            }

            Text("recording: \(timerViewModel.recording.description) \ntapped: \(timerViewModel.tapped.description)\ntiming: \(timerViewModel.timing.description)")
                .font(.body)
            
            List {
            
                ForEach(lastTimes, id: \.self){ index in
                    Text("\(index)")
                }
            }
            .padding(.top)
            .padding(.bottom)
            // needs .onMove, .OnEdit, ... modifiers.

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
        
        .onAppear {
            
        }
        
    }
    
}




struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
 

//extension Text {
//
//    func mod() -> some View {
//
//        self.frame(width: 300, height: 300)
//            .background(timerViewModel.isRunning ? .green :squareBackground)
//            .cornerRadius(25)
//
//    }
//
//}
