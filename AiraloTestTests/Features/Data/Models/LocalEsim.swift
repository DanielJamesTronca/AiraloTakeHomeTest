//
//  LocalEsim.swift
//  AiraloTestTests
//
//  Created by TRONCA DANIEL JAMES on 19/06/24.
//

@testable import AiraloTest

extension LocalEsimElement {
    static func stub() -> Self {
        LocalEsimElement(
            id: 10,
            slug: "slug",
            title: "title",
            image: ImageRepresentation(width: .zero, height: .zero, url: "url"),
            packageCount: 10
        )
    }
}
