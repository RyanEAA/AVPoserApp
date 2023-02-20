//
//  HomeMenuView.swift
//  Poser
//
//  Created by Ryan Aparicio on 1/31/23.
//

import SwiftUI

struct Item: Identifiable{
    let id = UUID()
    let title: String
    let image: String
    let imgColor: Color
}

struct HomeMenuView: View {
    @State private var capturedImage: UIImage? = nil // Property for the captured image
    @State private var isCustomCameraViewPresented = false // Property to track if the custom camera view is presented
    
    
    
    @State private var generatedImage: UIImage? = nil
    
    @State private var prompt: String = ""
    
    @State private var userChosenPrompt: String? = nil
    
    let items = [
        Item(title: "Family", image: "figure.2.and.child.holdinghands", imgColor: .red),
        Item(title: "Dancing", image:"figure.socialdance",
             imgColor: .yellow),
        Item(title: "Friends", image: "figure.2.arms.open",
             imgColor: .orange),
        Item(title: "Solo", image: "figure.arms.open",
             imgColor: .green),
        Item(title: "Home", image: "house",
             imgColor: .blue),
        Item(title: "Home", image: "house",
             imgColor: .purple),
        Item(title: "Dance", image: "figure.dance",
             imgColor: .black),
        
    ]
    
    let spacing: CGFloat = 10
    @State private var numberOfColumns = 5
    
    var body: some View {
        
        
        let columns = Array(
            repeating: GridItem(.flexible(), spacing: 10),
            count:                     numberOfColumns)
        
        ScrollView{
            
            headerView
            
            LazyVGrid(columns: columns, spacing: spacing) {
                ForEach(items){ item in
                    Button(action: {
                        
                        
                        print(item.title)
                        isCustomCameraViewPresented.toggle()
                        //self.userChosenPrompt = item.title
                        
                    }){
                        ItemView(item:item)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: Color.black.opacity(0.2), radius: 10, y: 5)
                }
            }
            .padding(.horizontal)
            .offset(y: -50)
            .sheet(isPresented: $isCustomCameraViewPresented, content: {
                // Present the custom camera view and pass the captured image and generated image bindings
                CustomCameraView(capturedImage: $capturedImage, generatedImage: $generatedImage)
            })
        }
        .background(Color.white)
        .ignoresSafeArea()
    }
    
    var headerView: some View{
        VStack{
            Image("avatar")
                .resizable()
                .frame(width: 110, height: 110)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .onTapGesture {
                    numberOfColumns = numberOfColumns % 3 + 1
                }
            Text("Mickey King")
                .foregroundColor(.white)
                .font(.system(size: 30, weight: .medium, design: .rounded))
            
            Text("Hey Fellas, Did somebody mention the Door of Darkness")
                .foregroundColor(Color.white.opacity(0.7))
                .foregroundColor(.white)
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .multilineTextAlignment(.center)
        }
        .frame(height: 350)
        .frame(maxWidth: .infinity)
        .background(Color.purple)
        
    }
    
}


struct HomeMenuView_Previews: PreviewProvider {
    static var previews: some View {
        HomeMenuView()
    }
}
