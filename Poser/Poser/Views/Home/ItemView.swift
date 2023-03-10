//
//  SwiftUIView.swift
//  Poser
//
//  Created by Ryan Aparicio on 2/20/23.
//

import SwiftUI

struct ItemView: View{
    
    let item: Item
    
    var body: some View{
        GeometryReader { reader in
            
            let fontSize = min(reader.size.width*0.2,28)
            let imageWidth: CGFloat = min(50, reader.size.width*0.6)
            
            VStack(spacing: 5) {
                Image(systemName:item.image)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(item.imgColor)
                    .frame(width: imageWidth)
                
                Text(item.title)
                    .font(.system(size: fontSize, weight: .bold, design: .rounded))
                    .foregroundColor(Color.black.opacity(0.9))
            }
            .frame(width: reader.size.width, height: reader.size.height)
            .background(Color.white)
        }
        .frame(height: 150)
    }
}
