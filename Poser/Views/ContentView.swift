//
//  ContentView.swift
//  Poser
//
//  Created by Ryan Aparicio on 1/23/23.
//

import SwiftUI

struct ContentView: View {
    
    
    
    
    var body: some View {
        VStack {
            
            Spacer()
            //HomeMenuView()
            //CameraButton()
            PromptGeneratorView()
                
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
