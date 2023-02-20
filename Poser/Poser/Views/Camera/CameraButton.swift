//
//  CameraButton.swift
//  Poser
//
//  Created by Ryan Aparicio on 1/24/23.
//
//https://www.youtube.com/watch?v=ZmPJBiwgZoQ&ab_channel=Rebeloper-RebelDeveloper
// CameraButton.swift
import SwiftUI

struct CameraButton: View {
    @Binding var generatedImage: UIImage?
    @State private var capturedImage: UIImage? = nil // Property for the captured image
    @State private var isCustomCameraViewPresented = false // Property to track if the custom camera view is presented
    
    var body: some View {
        ZStack{
            // Show the captured image or the background color
            if capturedImage != nil{
                Image(uiImage: capturedImage!)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            } else{
                Color(UIColor.systemBackground)
            }
            VStack{
                Spacer()
                Button(action: {
                    // Show the custom camera view when the button is pressed
                    isCustomCameraViewPresented.toggle()
                }, label: {
                    Image(systemName: "camera.fill")
                        .font(.largeTitle)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                })
                .padding(.bottom)
                .sheet(isPresented: $isCustomCameraViewPresented, content: {
                    // Present the custom camera view and pass the captured image and generated image bindings
                    CustomCameraView(capturedImage: $capturedImage, generatedImage: $generatedImage)
                })
            }
        }
        .onAppear {
            capturedImage = generatedImage // Set the captured image to the generated image
        }
    }
    
}

struct CameraButton_Previews: PreviewProvider {
    static var previews: some View {
        CameraButton(generatedImage: .constant(nil))
    }
}
