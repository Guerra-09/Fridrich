//
//  TimerView.swift
//  Fridrich
//
//  Created by José Guerra on 26-06-22.
//

import SwiftUI




struct TimerView: View {
    
    @ObservedObject var timerViewModel = TimerViewModel()
    @State var states: [String] = []
    @State var lastTimes: [String] = ["Tiempos"]
    @State var lastTimesInt: [Int] = []
    @State var scramble: [String]
    @State var squareBackground : Color = .red
    @State var minutin: Int = 0
    @State var average: Double = 0.0

    

    
    init(scramble: [String]) {
        self.scramble = getAlgorithm()  
    }
    
    
    var body: some View {

        // Long Tapped
        let longPressDrag = LongPressGesture(minimumDuration: 0.5)
        
            .onEnded { _ in
        
                if timerViewModel.timing == false {
    
                        //states = "Long press start"
                        timerViewModel.recording = true
                        timerViewModel.timing = true
                        timerViewModel.isRunning = true
                    
                } else {
                    timerViewModel.stop()
                    timerViewModel.isRunning = false
                    timerViewModel.timing = false
                    lastTimes.append(String(timerViewModel.secondsLastTime))
                    lastTimesInt.append(timerViewModel.secondsLastTime)
                    getAverage()
                }
            }
            .sequenced(before: DragGesture(minimumDistance: 0))
                        .onEnded { _ in
                            //states = "Long press release"
                            timerViewModel.recording = false
                            
                            timerViewModel.start()
                        }
        
            
        
            
        VStack {
            // States: just to see what the user it's doing
            //states = getAlgorithm()
            
            
///Mark: For the scramble view
//            HStack{
//
//
//                ForEach(scramble, id: \.self) { index in
//                    VStack{}
//                    Text("\(index) ")
//                }
//
//            }

            
            
            
            //  Time in the square
            Text("\(timerViewModel.secondsElapsed)")
                    .font(.custom("", size: 70))
                    .frame(width: 300, height: 300)
                    .background(timerViewModel.isRunning ? .green :squareBackground)
                    .cornerRadius(25)
            
            
            //  registring haptics
            
            Text("recording: \(timerViewModel.recording.description) \ntapped: \(timerViewModel.tapped.description)\ntiming: \(timerViewModel.timing.description)\ncounts: \(lastTimesInt.count)")
                .font(.body)
            
            
            // appended times
            List {
                ForEach(lastTimes, id: \.self){ index in
                    Text("\(index)")
                }
            }
            // needs .onMove, .OnEdit, ... modifiers.
            .padding(.top)
            .padding(.bottom)
            
            
            Text("AVG: \(average)")
            

        } // End of Vstack
        
        
        
        
        
        
        .onTapGesture {
            //states = "Tapped"
            
            
            // Appending time in list
            
            if timerViewModel.timing {
                timerViewModel.stop()
                timerViewModel.isRunning = false
                timerViewModel.timing = false
                lastTimes.append(String(timerViewModel.secondsLastTime))
                lastTimesInt.append(timerViewModel.secondsLastTime)
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
                getAverage()
            }
            
        }
        .gesture(longPressDrag)
        
        .onAppear {
            //scramble = getAlgorithm()
            
            
        }
        
    }
    
    func getAverage() {
        
        var sum = 0

        for times in lastTimesInt {
            
            sum += times
            average = Double(sum / lastTimesInt.count)
        }

        
    }
    
}




struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(scramble: getAlgorithm())
    }
}
 
