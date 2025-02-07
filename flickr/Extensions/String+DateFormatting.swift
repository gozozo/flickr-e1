//
//  String+DateFormatting.swift
//  flickr
//
//  Created by Luis Enrique Vazquez Escobar on 07/02/25.
//

import Foundation

extension String {
    func formattedDate() -> String {
        let dateFormatter = ISO8601DateFormatter()

        if let date = dateFormatter.date(from: self) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "MMM d, yyyy"
            return outputFormatter.string(from: date)
        } else {
            return self
        }
    }
}

