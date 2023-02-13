//
//  ContentView.swift
//  Poser
//
//  Created by Ryan Aparicio on 1/23/23.
//

import SwiftUI

struct ContentView: View {
    @State private var generatedImage: UIImage? = nil
    
    var body: some View {
        VStack {
            Spacer()
            PromptGeneratorView(generatedImage: $generatedImage)
            CameraButton(generatedImage: $generatedImage)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





