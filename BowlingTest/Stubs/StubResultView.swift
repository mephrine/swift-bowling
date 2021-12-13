//
//  StubResultView.swift
//  BowlingTest
//
//  Created by Mephrine on 2021/12/13.
//

import Foundation

struct StubResultView: Presentable {
	enum Verify {
		static var showGameBoard = false
	}
	
	func showGameBoard(of name: String, frames: [Frame]) {
		Verify.showGameBoard = true
	}
}
