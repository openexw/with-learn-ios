//
//  Styles.swift
//  design-code-x
//
//  Created by 薄荷 on 2024/11/22.
//


import SwiftUI

struct StrokeStyle:ViewModifier {
    var cornerRadius: CGFloat
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        content.overlay(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
            .stroke(.linearGradient(colors: [
                .white.opacity(colorScheme == .dark ? 0.1:0.3),
                .black.opacity(colorScheme == .dark ? 0.3:0.1)
            ], startPoint: UnitPoint.top, endPoint: .bottom))
                .blendMode(.overlay)
        )
    }
}

extension View {
    func strokeStyle(cornerRadius: CGFloat = 30) -> some View {
        modifier(StrokeStyle(cornerRadius: cornerRadius))
    }
}
