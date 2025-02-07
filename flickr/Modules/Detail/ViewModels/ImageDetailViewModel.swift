//
//  ImageDetailViewModel.swift
//  flickr
//
//  Created by Luis Enrique Vazquez Escobar on 07/02/25.
//

import Foundation

import SwiftUI

class ImageDetailViewModel: ObservableObject {
    @Published var imageModel: ImageDetailModel

    init(image: FlickrImage) {
        self.imageModel = ImageDetailModel(image: image)
    }
}
