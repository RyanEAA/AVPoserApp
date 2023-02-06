//
//  CameraButton.swift
//  Poser
//
//  Created by Ryan Aparicio on 1/24/23.
//
//https://www.youtube.com/watch?v=ZmPJBiwgZoQ&ab_channel=Rebeloper-RebelDeveloper
import SwiftUI

struct CameraButton: View {

    @State private var capturedImage: UIImage? = nil
    @State private var isCustomCameraViewPresented = false
    @State private var isLoading: Bool = false
    //@Binding var AIImage: UIImage?
    
    
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
                Button(action: { isCustomCameraViewPresented.toggle()
                    
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
                    CustomCameraView(capturedImage: $capturedImage)
                })
            }
        }
    }
}

struct CameraButton_Previews: PreviewProvider {
    static var previews: some View {
        CameraButton()
    }
}
