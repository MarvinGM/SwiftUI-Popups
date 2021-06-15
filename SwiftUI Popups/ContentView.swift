//
//  ContentView.swift
//  SwiftUI Popups
//
//  Created by Amben on 6/15/21.
//

import PopupView
import SwiftUI

struct ContentView: View {
    
    @State var isShowingPopUp = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    self.isShowingPopUp = true
                    
                }, label: {
                    Text("Show Pop Up")
                        .frame(width: 250, height: 50, alignment: .center)
                        .background(Color.green)
                        .cornerRadius(8)
                        .padding()
                })
                
            }
            .navigationTitle("SwiftUI Popups")
//            .popup(isPresented: $isShowingPopUp) {
//                PopUp()
//            }
            
            .popup(isPresented: $isShowingPopUp,
                   type: .toast,
                   position: .bottom,
                   animation: .easeIn,
                   autohideIn: 3, //nil if you dont want the autohide
                   dragToDismiss: false,
                   closeOnTap: true,
                   closeOnTapOutside: false,
                   view: {
                    PopUp()
                   })
        }
    }
}

struct PopUp: View {
    var body: some View {
        ZStack {
            Color.blue
            
            HStack {
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 35, height: 35, alignment: .center)
                    .foregroundColor(.white)
                    .padding()
                
                Text("You have 21 new messages waiting for you.")
                    .foregroundColor(.white)
            }
            .padding()
        }
        .cornerRadius(12)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
