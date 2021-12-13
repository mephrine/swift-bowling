//
//  ResultView.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/13.
//

import Foundation

protocol Presentable {
	func showGameBoard(of name: String, frames: [Frame])
}

struct ResultView: Presentable {
	enum UI {
		static let marginName: Int = 1
		static let marginScore: Int = 2
		static let seperator: String = "|"
	}
	
	func showGameBoard(of name: String, frames: [Frame]) {
		print(headSection)
		print(convertToBodySection(of: name))
	}
	
	private var headSection: String {
		let headerSection = ([" NAME "] + (1...10).map { String(format: "  %02d  ", $0)}).joined(separator: "|")
		return UI.seperator + headerSection + UI.seperator
	}
	
	private func convertToBodySection(of name: String) -> String {
		let bodySection = ([" \(name) "] + (1...10).map { String(format: "  %02d  ", $0)}).joined(separator: "|")
		return UI.seperator + bodySection + UI.seperator
	}
}
