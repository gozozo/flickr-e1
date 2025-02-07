//
//  FlickrViewModel.swift
//  flickr
//
//  Created by Luis Enrique Vazquez Escobar on 07/02/25.
//

import Foundation
import Combine

class FlickrViewModel: ObservableObject {
    @Published var images: [FlickrImage] = []
    @Published var searchText: String = ""

    private var cancellables = Set<AnyCancellable>()

    init() {
        $searchText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] text in
                self?.fetchImages(for: text)
            }
            .store(in: &cancellables)
    }

    func fetchImages(for tag: String) {
        guard !tag.isEmpty else {
            images = []
            return
        }

        let urlString = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=\(tag)"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: FlickrResponse.self, decoder: JSONDecoder())
            .map { response in
                response.items.map { item in
                    FlickrImage(title: item.title, imageURL: item.media.m, published: item.published.formattedDate(), author: item.author, description: item.description.htmlToPlainText())
                }
            }
            .receive(on: DispatchQueue.main)
            .replaceError(with: [])
            .sink { [weak self] images in
                self?.images = images
            }
            .store(in: &cancellables)
    }
}

