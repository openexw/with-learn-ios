//
//  SearchView.swift
//  BankEase
//
//  Created by 7yue on 2025/1/3.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // 使用 ForEach 动态生成输入框
                ForEach(searchs, id: \.self) { item in
                    NavigationLink {
                        switch item.type {
                        case .branch:
                            BranchView(seachText: "11")
                        case .interestRate:
                            InterestRateView()
                        case .exchangeRate:
                            ExchangeRateView()
                        case .exchange:
                            ExchangeView()
                        }
                    } label: {
                        SearchCardView(item: item)
                    }
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Search")
        }
//        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SearchView()
}
