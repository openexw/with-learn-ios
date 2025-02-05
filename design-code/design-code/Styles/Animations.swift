//
//  Animations.swift
//  design-code
//
//  Created by 7yue on 2024/12/1.
//

import SwiftUI

extension Animation {
    static let openCard = Animation.spring(response: 0.5, dampingFraction: 0.7)
    static let closeCard = Animation.spring(response: 0.6, dampingFraction: 0.9)
    
}
