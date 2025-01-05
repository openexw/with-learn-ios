//
//  SearchCardView.swift
//  BankEase
//
//  Created by 7yue on 2025/1/5.
//

import SwiftUI

struct SearchCardView: View {
    let item: SearchItem
    var body: some View {
        HStack {
            VStack( alignment: .leading,spacing: 8){
                Text(item.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.neutral01)
                Text(item.subtitle)
                    .font(.caption2)
                    .foregroundStyle(.accent)
            }
            Spacer()
            Image(item.background)
                .resizable()
                .frame(width: 100, height: 78)
        }
        .padding(16)
        .background(Color.white)
        .clipShape(.rect(cornerRadius: 15))
        .shadow(color: Color.black.opacity(0.05), radius: 30, x: 0, y: 5)
    }
}

#Preview {
    SearchCardView(item: searchs[0])
}
