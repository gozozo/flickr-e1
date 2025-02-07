//
//  HomeView.swift
//  flickr
//
//  Created by Luis Enrique Vazquez Escobar on 07/02/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = FlickrViewModel()

    var body: some View {
        NavigationView {
            VStack {

            }
            .navigationTitle("Flickr Search")
        }
    }
}

#Preview {
    HomeView()
}
