//
//  TabBarView.swift
//  Poser
//
//  Created by Ryan Aparicio on 1/23/23.
//

import SwiftUI

enum Tabs: Int {
    case chats = 0
    case profile = 1
}
//https://www.youtube.com/watch?v=R_KZwX-yP4o&ab_channel=CodeWithChris
struct TabBarView: View {
    
    @Binding var selectedTab: Tabs
    
    var body: some View {
        HStack(alignment: .center){
            
            Button{
                selectedTab = .chats
            } label:{
                TabBarButton(buttonText: "Chat", imageName: "bubble.left", isActive: selectedTab == .chats)
                
            }
            .tint(Color.gray)
            Button{
                
            } label:{
                VStack{
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width:24, height: 24)
                    Text("Download")
                        
                }
                
            }
            
            Button{
                selectedTab = .profile
            } label:{
                
                TabBarButton(buttonText: "Profile", imageName: "person", isActive: selectedTab == .profile)
                
                
            }
            .tint(Color.gray)
        }
        .frame(height: 82)
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selectedTab: .constant(.profile))
    }
}
