//
//  TimerView.swift
//  Fridrich
//
//  Created by José Guerra on 26-06-22.
//

import SwiftUI




struct TimerView: View {
    
    @ObservedObject var timerViewModel = TimerViewModel()
    @State var scramble: [String]
    @State var squareBackground : Color = .red
    @State var isRunning: Bool = false
    @State var timeStopped: String = "0:0:00"
    @State var pressing: Bool = false
    @State var tapped: Bool = false
    @State var lastTimes: [String] = []

    init(scramble: [String]) {
        self.scramble = getAlgorithm()  
    }
    
    
    var body: some View {

        // Long Tapped
        let longPressDrag = LongPressGesture(minimumDuration: 0.5)
            .onEnded { _ in

                //states = "Long press start"
                timerViewModel.timeElapsedFormatted = "00:00.00"
                pressing.toggle()

                if pressing {
                    squareBackground = Color.yellow
                    print("Pressing")
                }
                

                
            }
            .sequenced(before: DragGesture(minimumDistance: 0))
        
                        .onEnded { _ in
                            //states = "Long press release"
                            timeStopped = "\(timerViewModel.timeElapsedFormatted)"
                            pressing.toggle()
                            isRunning.toggle()
                            
                            if isRunning {
                                
                                timerViewModel.start()
                                
                            } else {
                                
                                timeStopped = timerViewModel.timeElapsedFormatted
                                timerViewModel.stop()
                                
                            }
                            
                        }
        
            
        
            
        VStack {
            
            HStack {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.leading, 30)
                    .onTapGesture {
                        //Aqui se supone que se abre un pop up con informacion
                    }
                
                Spacer()
                Image(systemName: "gear")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.horizontal, 30)
                    .onTapGesture {
                        //Aqui se supone que se abren las configuraciones
                    }
            }
            
            
         
            VStack {
                
                /// Mark: States: just to see what the user it's doing
//                Text("pressing: \(pressing.description)\nrunning: \(isRunning.description)\nTapped:                   \(tapped.description)")
                
                
                /// Mark: For the scramble view
                // Is not working well (ayua lope)
//                HStack{
//                    ForEach(scramble, id: \.self) { index in
//
//                        Text("\(index)")
//
//                    }
//                }

                //Time in a square object
                VStack{
                    Text(isRunning ? "\(timerViewModel.timeElapsedFormatted)" : "\(timeStopped)" )
                            .font(.custom("", size: 70))
                            .frame(width: 300, height: 300)
                            .background(timerViewModel.mode == .stopped ? squareBackground: .green)
                            .cornerRadius(25)
                }
                .onTapGesture(count: 2, perform: {
                    
                    squareBackground = .red
                    timerViewModel.timeElapsedFormatted = "00:00.00"
                    timeStopped = "0:0:00"
                    timerViewModel.stop()

                })
                
                . onTapGesture {
                    //states = "Tapped"
                        
                    if isRunning {
                        
            
                        squareBackground = .red
                        timeStopped = "\(timerViewModel.timeElapsedFormatted)"
                        lastTimes.append(timeStopped)
                        isRunning = false
                        timerViewModel.stop()
                        
                        
                        
                    } else {
                        tapped.toggle()
                        squareBackground = .yellow
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            tapped.toggle()
                            squareBackground = .red
                                    }
                    }
                    
                        
                }
                
                /// Mark:  appended times
            
                
                List {
                    ForEach(lastTimes, id: \.self) { index in
                            Text("\(index)")
                    }
                // needs .onMove, .OnEdit, ... modifiers.
                }
                .padding(.top)
                .padding(.bottom)

            }// End of Vstack #2
    
                
            }
            .gesture(longPressDrag)
            
            
        } // End of Vstack #1
        //Loading data at the beggining of the app
//        .onAppear {
//            //scramble = getAlgorithm()
//            
//            
//            }

}





struct scrambleView: View {
    
    @State var scramble: [String]
    
    init(scramble: [String]) {
        self.scramble = getAlgorithm()
    }
    
    var body: some View {
        
        VStack {
            
            VStack{
                ForEach(scramble, id: \.self) { index in

                    //Text("\(index)")
                    Text("\(index.count)")

                }
            }
        }

        
        
        
        
    }
}






struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(scramble: getAlgorithm())
        //scrambleView(scramble: getAlgorithm())
    }
}

