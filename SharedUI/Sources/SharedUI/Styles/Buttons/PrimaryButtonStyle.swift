//
//  File.swift
//  
//
//  Created by Tom Novotny on 24.02.2023.
//

import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        Rectangle()
            .overlay {
                configuration.label
                    .foregroundColor(Color.white)
            }
            .frame(height: 56)
            .cornerRadius(8)
    }
}
