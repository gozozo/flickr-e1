//
//  ImageGridView.swift
//  flickr
//
//  Created by Luis Enrique Vazquez Escobar on 07/02/25.
//

import SwiftUI

struct ImageGridView: View {
    let images: [FlickrImage]
    let columns = [GridItem(.adaptive(minimum: 100))]
    var onImageSelected: (FlickrImage) -> Void

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(images) { image in
                    AsyncImage(url: image.imageURL) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable().scaledToFit()
                        case .failure:
                            Image(systemName: "photo")
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .frame(height: 100)
                    .cornerRadius(8)
                    .onTapGesture {
                        onImageSelected(image)
                    }
                }
            }
            .padding()
        }
    }
}
