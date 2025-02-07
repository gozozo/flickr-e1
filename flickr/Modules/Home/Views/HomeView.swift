//
//  HomeView.swift
//  flickr
//
//  Created by Luis Enrique Vazquez Escobar on 07/02/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = FlickrViewModel()
    @State private var selectedImage: FlickrImage?
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(text: $viewModel.searchText)
                ImageGridView(images: viewModel.images) { image in
                    selectedImage = image
                }
            }
            .navigationTitle("Flickr Search")
        }.sheet(item: $selectedImage) { image in
            
         }
    }
}

#Preview {
    HomeView()
}
