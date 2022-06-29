//
//  test.swift
//  Fridrich
//
//  Created by José Guerra on 26-06-22.
//
import SwiftUI





//struct test: View {
//
//    /// for visual indicators
//    @State var recording = false
//    @State var tapped = false
//
//    var body: some View {
//        let longPressDrag = LongPressGesture(minimumDuration: 0.5)
//            .onEnded { _ in
//                print("Long press start")
//                recording = true
//            }
//            .sequenced(before: DragGesture(minimumDistance: 0))
//            .onEnded { _ in
//                print("Long press release")
//                recording = false
//            }
//
//        Circle()
//            .fill(recording ? Color.red : Color.blue)
//            .opacity(tapped ? 0.5 : 1)
//            .frame(width: 100, height: 100)
//
//            .onTapGesture {
//                print("Tapped")
//
//                tapped = true
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { tapped = false }
//            }
//            .gesture(longPressDrag)
//
//    }
//}




























//import SwiftUI
//
//
//class StopWatchManager: ObservableObject {
//        
//    @Published var secondsElapsed = 0.0
//    var timer = Timer()
//    
//    
//    func start() {
//      timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
//            self.secondsElapsed += 0.1
//        }
//    }
//}
//
//
//struct test: View {
//    
//    @ObservedObject var stopWatchManager = StopWatchManager()
//    
//    var body: some View {
//        
//        VStack {
//            Text(String(format: "%.1f", stopWatchManager.secondsElapsed))
//                .font(.custom("Avenir", size: 40))
//                .padding(.top, 200)
//                .padding(.bottom, 100)
//            Button(action: {self.stopWatchManager.start()}) {
//                
//                TimerButton(label: "Start", buttonColor: .blue)
//                
//            }
//            Spacer()
//        }
//    }
//}
//
//struct TimerButton: View {
//    
//    let label: String
//    let buttonColor: Color
//    
//    var body: some View {
//        Text(label)
//            .foregroundColor(.white)
//            .padding(.vertical, 20)
//            .padding(.horizontal, 90)
//            .background(buttonColor)
//            .cornerRadius(10)
//    }
//}
//
//struct test_Previews: PreviewProvider {
//    static var previews: some View {
//        test()
//    }
//}




















