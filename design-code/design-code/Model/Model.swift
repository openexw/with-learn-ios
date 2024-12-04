//
//  Model.swift
//  design-code
//
//  Created by 7yue on 2024/12/1.
//

import Foundation
import Combine

class Model : ObservableObject {
    @Published var showDetial: Bool = false
    @Published var selectedModal: Modal = .signIn
}

enum Modal: String {
    case signUp
    case signIn
}
