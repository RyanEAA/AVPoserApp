//
//  ItemButtonStyle.swift
//  Poser
//
//  Created by Ryan Aparicio on 2/20/23.
//

import SwiftUI

struct ItemButtonStyle: ButtonStyle {
    let cornerRadius: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack{
            configuration.label
            
            if configuration.isPressed{
                Color.black.opacity(0.2)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.black.opacity(0.2), radius: 10, y: 5)
        
    }
}
