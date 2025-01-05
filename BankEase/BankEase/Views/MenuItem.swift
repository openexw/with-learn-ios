//
//  MenuItem.swift
//  BankEase
//
//  Created by 7yue on 2025/1/5.
//

import SwiftUI



struct MenuCardView: View {
    @State var item: MenuItem
    
    var body: some View {
        VStack(spacing: 12) {
            Image(item.icon)
                .font(.system(size: 28))
             .frame(width: 28, height: 28)
            Text(item.title)
                .font(.caption2)
                .fontWeight(.bold)
//                .frame(maxWidth: 48)
                .foregroundStyle(Color.init(hex: "979797"))
        }
        
        .frame(width: 100, height: 100)
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 15))
        .shadow(color: Color.black.opacity(0.05), radius: 30, x: 0, y: 5)
    }
}

#Preview {
    MenuCardView(item: menus[0])
}
