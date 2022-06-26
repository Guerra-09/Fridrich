//
//  ProfileView.swift
//  Fridrich
//
//  Created by José Guerra on 26-06-22.
//

import SwiftUI

struct UserModel {
    
    let displayName: String
    
}





struct ProfileView: View {
    
    @AppStorage("username") var username: String = "Unnamed"
    @State var newUsername: String = ""
    @State var editingName: Bool = false

    
    
    var body: some View {
        
        VStack {

            ZStack {
            
                Circle()
                    .foregroundColor(.red)
                    .frame(width: 300, height: 300)

                    
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                        
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 40, alignment: .bottomLeading)
                        .foregroundColor(.green)
                        .padding(.leading, 120)
                        .padding(.top, 120)
     
            }
            
            
            HStack {
                
                Text(username)
                    .font(.title)
                
                Image(systemName: "pencil.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                
                
                    .onTapGesture {
                                 
                        editingName.toggle()
                        
                    }
                
            }
                  
            
            if editingName {
                
                TextField("Name", text: $newUsername)
                        .frame(width: 300, height: 30)
                        .padding(.top, 80)
                        .textFieldStyle(.roundedBorder)
                        

                
                Button {
                    
                    username = newUsername
                    
                    
                } label: {
                    Text("Save")
                        .frame(width: 280, height: 60)
                        .background(.blue)
                        .cornerRadius(25)
                        .foregroundColor(.white)
                }
            } 
            
            
           
                
                

            
            
            
            
            
            Spacer()
            
        } //End of VStack

        
        
             
        
    }
    
}




struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
