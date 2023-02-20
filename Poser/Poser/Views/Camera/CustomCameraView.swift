//
//  CustomCameraView.swift
//  Poser
//
//  Created by Ryan Aparicio on 1/24/23.
//
//


import SwiftUI
import AVFoundation

struct CustomCameraView: View {
    let cameraService = CameraService()
    @Binding var capturedImage: UIImage?
    @Binding var generatedImage: UIImage?
    //@Binding var photoTaken: Bool // to see when image has been taken
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        // ZStack for stacking the camera view and the generated image view
        ZStack {
            // Camera view using the CameraView struct
            CameraView(cameraService: cameraService) { result in
                switch result {
                case .success(let photo):
                    if let data = photo.fileDataRepresentation() {
                        capturedImage = UIImage(data: data)
                        presentationMode.wrappedValue.dismiss() // Dismisses the camera view after the image has been captured
                    } else {
                        print("Error: no image data found")
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
            
            // Generated image view that appears on top of the camera view
            if let generatedImage = generatedImage {
                Image(uiImage: generatedImage)
                    .resizable()
                    .scaledToFit()
                    .opacity(0.5)
                    .scaleEffect(0.8)
            }
            
            // Button for capturing the photo
            VStack {
                Spacer()
                Button(action: {
                    cameraService.capturePhoto()
                }, label: {
                    Image(systemName: "circle")
                        .font(.system(size: 72))
                        .foregroundColor(.white)
                })
                .padding(.bottom)
            }
        }
    }
}

struct CustomCameraView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCameraView(capturedImage: .constant(UIImage()), generatedImage: .constant(UIImage()))
    }
}
