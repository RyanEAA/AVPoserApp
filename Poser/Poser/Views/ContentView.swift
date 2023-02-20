//
//  ContentView.swift
//  Poser
//
//  Created by Ryan Aparicio on 1/23/23.
//

import SwiftUI

struct ContentView: View {
    @State private var photoTaken = false // add new variable

    @State private var generatedImage: UIImage? = nil
    
    @State private var prompt: String = ""
    
    var body: some View {
        HomeMenuView()
//        VStack {
//            Spacer()
//            PromptGeneratorView(generatedImage: $generatedImage)
//            CameraButton(generatedImage: $generatedImage)
//
//        }
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





