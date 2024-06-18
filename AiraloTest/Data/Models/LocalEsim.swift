//
//  LocalEsim.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import Foundation

typealias LocalEsim = [LocalEsimElement]

struct LocalEsimElement: Codable {
    let id: Int
    let slug, title: String
    let image: ImageRepresentation
    let packageCount: Int

    enum CodingKeys: String, CodingKey {
        case id, slug, title, image
        case packageCount = "package_count"
    }
}

extension LocalEsimElement {
    var imageUrl: URL? {
        guard let url = URL(string: image.url) else { return nil }
        return url
    }
}

struct ImageRepresentation: Codable, Hashable {
    let width, height: Int
    let url: String
}
