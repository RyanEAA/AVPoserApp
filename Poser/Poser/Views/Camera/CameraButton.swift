//
//  CameraButton.swift
//  Poser
//
//  Created by Ryan Aparicio on 1/24/23.
//
//https://www.youtube.com/watch?v=ZmPJBiwgZoQ&ab_channel=Rebeloper-RebelDeveloper
import SwiftUI

struct CameraButton: View {
    @Binding var generatedImage: UIImage?
    
    @State private var capturedImage: UIImage? = nil
    @State private var isCustomCameraViewPresented = false
    
    var body: some View {
        ZStack{
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
                    CustomCameraView(capturedImage: $capturedImage, generatedImage: $generatedImage)
                })
            }
        }
        .onAppear {
            capturedImage = generatedImage
        }
    }
}

struct CameraButton_Previews: PreviewProvider {
    static var previews: some View {
        CameraButton(generatedImage: .constant(nil))
    }
}
