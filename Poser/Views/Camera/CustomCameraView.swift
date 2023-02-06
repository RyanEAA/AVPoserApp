//
//  CustomCameraView.swift
//  Poser
//
//  Created by Ryan Aparicio on 1/24/23.
//

import SwiftUI

struct CustomCameraView: View{
    
    let cameraService = CameraService()
    @Binding var capturedImage: UIImage?
    //@Binding var AIImage: UIImage?
    
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View{
        ZStack{
            CameraView(cameraService: cameraService){ result in
                switch result{
                case .success(let photo):
                    if let data = photo.fileDataRepresentation(){
                        capturedImage = UIImage(data: data)
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        print("Error: no image data found")
                    }
                case .failure(let err):
                    print(err.localizedDescription)
                    
                }
                
            }
            
            VStack{
                //PromptGeneratorView() has prompt generator view overlap 
                Spacer()
                Button(action: {
                    //action once button for photo has been clicked
                    cameraService.capturePhoto()
                    
                    //place pose suggestion
                    
                    
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
