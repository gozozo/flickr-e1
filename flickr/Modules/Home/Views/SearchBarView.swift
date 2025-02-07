//
//  SearchBarView.swift
//  flickr
//
//  Created by Luis Enrique Vazquez Escobar on 07/02/25.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String

    var body: some View {
        TextField("Search...", text: $text)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
    }
}
