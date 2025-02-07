//
//  FlickrResponse.swift
//  flickr
//
//  Created by Luis Enrique Vazquez Escobar on 07/02/25.
//

import Foundation

struct FlickrResponse: Codable {
    let items: [FlickrItem]
}

struct FlickrItem: Codable {
    let title: String
    let media: FlickrMedia
    let published: String
    let author: String
    let description: String
}

struct FlickrMedia: Codable {
    let m: URL
}
