//
//  menu.swift
//  BankEase
//
//  Created by 7yue on 2025/1/5.
//

import Foundation
import SwiftUI

var menus = [
    MenuItem(icon: "wallet",   title: "Account and Card"),
    MenuItem(icon: "sync-devices", title: "Transfer"),
    MenuItem(icon: "credit-card-in", title: "Withdraw"),
    MenuItem(icon: "mobile-banking", title: "Mobile prepaid"),
    MenuItem(icon: "receipt-list", title: "Pay the bill"),
    MenuItem(icon: "pig", title: "Save online"),
    MenuItem(icon: "credit-card", title: "Credit card"),
    MenuItem(icon: "file-paragraph", title: "Transaction report"),
    MenuItem(icon: "contacts", title: "Beneficiary"),
]

struct MenuItem: Identifiable,Hashable {
    let id = UUID()
    var icon: String
    var title: String
}
