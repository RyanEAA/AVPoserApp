//
//  DallEImageGenerator.swift
//  Poser
//
//  Created by Ryan Aparicio on 1/30/23.

import SwiftUI

// Defines a SwiftUI View named PromptGeneratorView
struct PromptGeneratorView: View {
    
    // State property for storing the user entered prompt
    @State private var prompt: String = ""
    
    // State property for storing the generated image
    @State private var image: UIImage? = nil
    
    // State property for tracking the loading state
    @State private var isLoading: Bool = false
    
    
    
    // The body of the view
    var body: some View {
        VStack(alignment: .leading) {
            // TextField for entering the prompt
            TextField("Enter Prompt", text: $prompt, axis: .vertical)
                .textFieldStyle(.roundedBorder)
            
            // Button to trigger image generation
            Button("Generate") {
                // Sets isLoading to true when the button is pressed
                isLoading = true
                
                // Use a Task to asynchronously generate the image
                Task {
                    do {
                        // Call the generateImage function from the DallEImageGenerator class
                        let response = try await DallEImageGenerator.shared.generateImage(withPrompt: prompt, apiKey: "GOTODALLETWO TO GENERATE KEY AND PLACE HERE")
                        
                        // Extract the first URL from the response
                        if let url = response.data.map(\.url).first {
                            // Retrieve the image data from the URL
                            let (data, _) = try await URLSession.shared.data(from: url)
                            
                            // Create a UIImage from the image data
                            image = UIImage(data: data)
                            
                            // Set isLoading to false when the image has been generated
                            isLoading = false
                        }
                    } catch {
                        // Print the error if one occurs
                        print(error)
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            
            // Display the generated image or the loading state
            if let image {
                // Show the generated image
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else {
                GeometryReader { geometry in
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 256, height: 256)
                        .background(Color.clear)
                        .overlay(
                            VStack {
                                // Show the progress view and "Loading..." text when isLoading is true
                                if self.isLoading {
                                    ProgressView()
                                    Text("Loading...")
                                }
                            }
                        )
                        .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
                }
                
            }
            
            //CameraButton()
            
            
        }
        
        .padding()
    }
        
}

// Preview provider for the PromptGeneratorView
struct PromptGeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        PromptGeneratorView()
    }
}