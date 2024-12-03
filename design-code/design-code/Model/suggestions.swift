//
//  suggestions.swift
//  design-code
//
//  Created by 7yue on 2024/12/2.
//

import Foundation
import SwiftUI

struct Suggestion: Identifiable {
    let id = UUID()
    var text: String
}
var suggestions = [
    Suggestion(text: "SwiftUI"),
    Suggestion(text: "React"),
    Suggestion(text: "Design")
]

