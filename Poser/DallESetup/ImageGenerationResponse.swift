//
//  ImageGenerationResponse.swift
//  Poser
//
//  Created by Ryan Aparicio on 1/30/23.
//

import Foundation

struct ImageGenerationResponse: Codable {
    struct ImageResponse: Codable {
        let url: URL
    }
    
    let created: Int
    let data: [ImageResponse]
}
