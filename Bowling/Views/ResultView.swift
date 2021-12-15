//
//  ResultView.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/13.
//

import Foundation

protocol Presentable {
	func showGameBoardWhenGameStarts(of name: String)
	func showScoreOnTheGameBoard(of name: String, frames: [Frame])
	func occurError(error: BowlingError)
}

struct ResultView: Presentable {
	enum UI {
		static let marginLeading: Int = 2
		static let seperator: String = " | "
	}
	
	func showGameBoardWhenGameStarts(of name: String) {
		print(headSection)
		print(convertToBodySection(of: name))
	}
	
	func showScoreOnTheGameBoard(of name: String, frames: [Frame]) {
		print(headSection)
		print(convertToBodySection(of: name, frames: frames))
	}
	
	func occurError(error: BowlingError) {
		print(error.errorDescription)
	}
	
	private var headSection: String {
		let headerSection = ([" NAME "] + (1...10).map { String(format: "  %02d  ", $0)}).joined(separator: UI.seperator)
		return UI.seperator + headerSection + UI.seperator
	}
	
	private func convertToBodySection(of name: String) -> String {
		let bodySection = ([" \(name) "] + (1...10).map { _ in  "  " }).joined(separator: UI.seperator)
		return UI.seperator + bodySection + UI.seperator
	}
	
	private func convertToBodySection(of name: String, frames: [Frame]) -> String {
		let bodySection = ([" \(name) "] + frames.map { $0.mark })
												.joined(separator: UI.seperator)
		return UI.seperator + bodySection + UI.seperator
	}
}
