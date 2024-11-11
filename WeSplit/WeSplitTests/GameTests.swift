//
//  GameTests.swift
//  WeSplitTests
//
//  Created by 7yue on 2024/11/11.
//

import XCTest
@testable import WeSplit

final class GameTests: XCTestCase {
    
    var game: Game!
    override func setUpWithError() throws {
        game = Game()
    }
    
    override func tearDownWithError() throws {
        game = nil
    }
    
    func testScorePositive(){
        var wans = game.target + 5
        var score = game.points(val: wans)
        XCTAssertEqual(score, 95)
    }
    
    func testScoreNegative(){
        var wans = game.target - 5
        var score = game.points(val: wans)
        XCTAssertEqual(score, 95)
    }
}
