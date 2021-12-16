//
//  Bowling - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

let inputView = InputView()
let resultView = ResultView()
let bowlingGame = BowlingGame(inputView: inputView, resultView: resultView)
bowlingGame.enterGame()

