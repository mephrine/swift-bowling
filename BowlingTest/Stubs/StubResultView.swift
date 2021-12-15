//
//  StubResultView.swift
//  BowlingTest
//
//  Created by Mephrine on 2021/12/13.
//

import Foundation

final class StubResultView: Presentable {
	private(set) var showingCount = 0
	
	enum Verify {
		static var showGameBoardWhenGameStarts = false
		static var showScoreOnTheGameBoard = false
	}
	
	func showGameBoardWhenGameStarts(of name: String) {
		Verify.showGameBoardWhenGameStarts = true
	}
	
	func showScoreOnTheGameBoard(of name: String, frames: [Frame]) {
		showingCount += 1
		Verify.showScoreOnTheGameBoard = true
	}
}
