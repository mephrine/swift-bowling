//
//  StubResultView.swift
//  BowlingTest
//
//  Created by Mephrine on 2021/12/13.
//

import Foundation

final class StubResultView: Presentable {
	private(set) var showingCount = 0
	private(set) var occuredError: BowlingError? = nil
	
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
	
	func occurError(error: BowlingError) {
		occuredError = error
	}
	
	func clear() {
		Verify.showScoreOnTheGameBoard = false
		Verify.showGameBoardWhenGameStarts = false
		showingCount = 0
		occuredError = nil
	}
}
