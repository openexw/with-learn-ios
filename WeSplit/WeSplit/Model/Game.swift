//
//  FishingGame.swift
//  WeSplit
//
//  Created by 7yue on 2024/11/10.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1

    func points(val: Int) -> Int {
        100 - abs(target - val)
    }
}
