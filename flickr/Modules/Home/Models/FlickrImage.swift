//
//  FlickrImage.swift
//  flickr
//
//  Created by Luis Enrique Vazquez Escobar on 07/02/25.
//

import Foundation

// Models
struct FlickrImage: Identifiable {
    let id = UUID()
    let title: String
    let imageURL: URL
}
