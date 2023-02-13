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
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
            ZStack {
                CameraView(cameraService: cameraService) { result in
                    switch result {
                    case .success(let photo):
                        if let data = photo.fileDataRepresentation() {
                            capturedImage = UIImage(data: data)
                            presentationMode.wrappedValue.dismiss()
                        } else {
                            print("Error: no image data found")
                        }
                    case .failure(let err):
                        print(err.localizedDescription)
                    }
                }
                
                if let generatedImage = generatedImage {
                                Image(uiImage: generatedImage)
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(0.5)
                                    .scaleEffect(0.8)
                            }
                
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
