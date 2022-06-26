//
//  ContentView.swift
//  Fridrich
//
//  Created by José Guerra on 25-06-22.
//

import SwiftUI


struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            TabView {
                
                TimerView()
                    .tabItem {
                        Image(systemName: "timer")
                        Text("time")
                    }
                
                Text("Coming Soon")
                    .tabItem {
                        Image(systemName: "cube.transparent")
                        Text("Algorithms")
                    }
                
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("profile")
                    }
                
                
                 
                
                
                
            } //End TabView
            
            .navigationTitle("TimeView")
            
        } // End NavigationView
        
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
