//
//  GhostButtonStyle.swift
//  AiraloTest
//
//  Created by TRONCA DANIEL JAMES on 18/06/24.
//

import SwiftUI

struct GhostButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .foregroundStyle(.primary)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                .stroke(.primary, lineWidth: 1)
            )
    }
}

extension ButtonStyle where Self == GhostButtonStyle {
    static var ghost: Self {
        return .init()
    }
}
