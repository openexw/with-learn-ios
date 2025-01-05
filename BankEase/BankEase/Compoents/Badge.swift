//
//  Badge.swift
//  BankEase
//
//  Created by 7yue on 2025/1/3.
//

import SwiftUI


extension View {
    func badge(count: Int?) -> some View {
        overlay {
            ZStack(alignment: .center) {
                if let count, count > 0 {
                    Circle()
                        .fill(Color.semantic01)
                    Text("\(count)")
                        .foregroundColor(.white)
                        .font(.caption)
                }
            }
            .offset(CGSize(width: 9, height: -9))
            .frame(width: 18, height: 18)
        }
    }
}
