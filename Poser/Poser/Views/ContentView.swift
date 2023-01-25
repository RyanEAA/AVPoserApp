//
//  ContentView.swift
//  Poser
//
//  Created by Ryan Aparicio on 1/23/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab: Tabs = .profile
    @State private var capturedImage: UIImage? = nil
    @State private var isCustomCameraViewPresented = false
    
    var body: some View {
        VStack {
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
            
            Spacer()
            
            TabBarView(selectedTab: $selectedTab)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
