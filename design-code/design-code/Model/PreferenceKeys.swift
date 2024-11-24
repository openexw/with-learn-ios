//
//  PreferenceKeys.swift
//  design-code
//
//  Created by 7yue on 2024/11/24.
//
import SwiftUI

struct PreferenceKeys: PreferenceKey{
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
