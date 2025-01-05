//
//  CreditCardView.swift
//  BankEase
//
//  Created by 7yue on 2025/1/4.
//

import SwiftUI

struct CreditCardView: View {
    enum Style : String {
        case normal
        case strip
    }
    @State var style:Style = .normal
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 20) {
                Text("John Smith")
                    .font(.title2)
                    .padding(.bottom, 20)
                
                
                Text("Amazon Platinium")
                    .font(.headline)
                    .fontWeight(.medium)
                
                Text("4756 •••• •••• 9018")
                    .font(.title3)
                    .foregroundColor(.white)
                
                Text("$3.469.52")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .foregroundStyle(.neutral06)
            .padding(.horizontal,20)
            .padding(.vertical, 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                ZStack {
                    RoundedCorner(radius: 30, corners: .allCorners)
                        .fill(.cardbg)
                        .layoutPriority(2)
                    
                    //                     右上角的圆 B
                    Circle()
                        .fill(Color.init(hex: "4EB4FF"))
                        .frame(width: 188, height: 188)
                        .offset(x: 180, y: -59)
                        .layoutPriority(2)
                    
                    //                     左下角的圆 A
                    Circle()
                        .fill(Color.init(hex: "1E1671"))
                        .frame(width: 350, height: 350)
                        .offset(x: -130, y: -15)
                        .layoutPriority(2)
                    
                }
            )
            .clipShape(.rect(cornerRadius: 30))
            .background(alignment: .bottom,content: {
                if style == .strip {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.primary02)
                        .padding(.horizontal, 40)
                        .offset(y: 14)
                        .frame(height: 14)
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.semantic01)
                        .padding(.horizontal, 30)
                        .frame(height: 14)
                        .offset(y:7)
                }
            })
            
            .padding(.bottom, style == .strip ? 14 : 0)
            .overlay(
                Image("visa-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 47)
                    .padding(.bottom, 43)
                    .padding(.trailing, 44),
                alignment: .bottomTrailing
            )
        }
    }
    
    
    
}

#Preview {
    CreditCardView(style: .strip)
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
