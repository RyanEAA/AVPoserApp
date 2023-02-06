//
//  ImageVIew.swift
//  Poser
//
//  Created by Ryan Aparicio on 2/4/23.
//

import SwiftUI

struct ImageVIew: View {
    var image: UIImage?
        var body: some View {
            Image(uiImage: image!)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    
}

struct ImageVIew_Previews: PreviewProvider {
    static var previews: some View {
        ImageVIew()
    }
}
