//
//  HomeMenuView.swift
//  Poser
//
//  Created by Ryan Aparicio on 1/31/23.
//

import SwiftUI
import Kingfisher

struct HomeMenuView: View {
    
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

struct HomeMenuView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMenuView()
    }
}
