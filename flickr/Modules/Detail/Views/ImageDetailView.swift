//
//  ImageDetailView.swift
//  flickr
//
//  Created by Luis Enrique Vazquez Escobar on 07/02/25.
//

import SwiftUI

struct ImageDetailView: View {
    @ObservedObject var viewModel: ImageDetailViewModel

    var body: some View {
        VStack {
            AsyncImage(url: viewModel.imageModel.image.imageURL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                case .failure:
                    EmptyView()
                @unknown default:
                    EmptyView()
                }
            }
            .padding()

            Text(viewModel.imageModel.image.title)
                .font(.title)
                .padding()
            Text(viewModel.imageModel.image.description)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.body)
                .padding(.bottom, 16)
            Text("By: ")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.footnote)
                .bold()
            Text(viewModel.imageModel.image.author)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.footnote)
                .padding(.bottom, 16)

            Text("Published: \(viewModel.imageModel.image.published)")
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .font(.caption)
                    .bold()

        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}
