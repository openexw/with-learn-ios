//
//  search.swift
//  BankEase
//
//  Created by 7yue on 2025/1/5.
//

import Foundation

struct SearchItem: Hashable {
    var title:String
    var subtitle:String
    var background:String
    var type:SearchType
}

enum SearchType:String {
    case branch
    case interestRate
    case exchangeRate
    case exchange
}
var searchs = [
    SearchItem(title: "Branch", subtitle: "Search for branch", background: "branch", type: .branch),
    SearchItem(title: "Interest rate", subtitle: "Search for interest rate", background: "interest-rate", type: .interestRate),
    SearchItem(title: "Exchange rate", subtitle: "Search for exchange rate", background: "exchange-rate", type: .exchangeRate),
    SearchItem(title: "Exchange", subtitle: "Exchange amount of money", background: "exchange", type: .exchange)
]

struct SearchBranchItem:Identifiable {
    let id = UUID()
    var title:String
    var distance:String
}

var branchItems = [
    SearchBranchItem(title: "新华路信息", distance: "50m"),
    SearchBranchItem(title: "新华路1", distance: "52m"),
    SearchBranchItem(title: "新华路1", distance: "53m"),
]
