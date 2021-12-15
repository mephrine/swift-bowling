//
//  NormalFrame.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/02.
//

import Foundation

struct NormalFrame: Running {
	let balls: [Ball]
	
	init(balls: [Ball] = []) {
		self.balls = balls
	}
	
	var mark: String {
		let mark = balls
			.map { $0.knockedDownPin }
			.map(String.init)
			.joined(separator: "|")
		return " \(mark) "
	}
	
	func score(of ball: Ball) throws -> Frame {
		let balls = self.balls + [ball]
		if balls.isStrike { return Strike.makeNewFrame(from: self, balls: balls) }
		if balls.isSpare { return Spare.makeNewFrame(from: self, balls: balls) }
		if balls.isMiss { return Miss.makeNewFrame(from: self, balls: balls) }
		if balls.isGutter { return Gutter.makeNewFrame(from: self, balls: balls) }
		return Self.makeNewFrame(from: self, balls: balls)
	}
	
	static func makeNewFrame(from currentframe: Frame, balls: [Ball]) -> NormalFrame {
		return NormalFrame(balls: balls)
	}
}

fileprivate extension Array where Element == Ball {
	var isStrike: Bool {
		self.first?.knockedDownPin == BowlingOption.numberOfPins
	}
	
	var isSpare: Bool {
		guard isSecondFrame else { return false }
		let score = self
			.map { $0.knockedDownPin }
			.reduce(0) { result, ball in
				result + ball
			}
		return score == BowlingOption.numberOfPins
	}
	
	var isMiss: Bool {
		guard isSecondFrame else { return false }
		let score = self
			.map { $0.knockedDownPin }
			.reduce(0) { result, ball in
				result + ball
			}
		return score < BowlingOption.numberOfPins && score > 0
	}
	
	var isGutter: Bool {
		guard isSecondFrame else { return false }
		let score = self
			.map { $0.knockedDownPin }
			.reduce(0) { result, ball in
				result + ball
			}
		return score == 0
	}
	
	var isSecondFrame: Bool {
		self[safe: 1] != nil
	}
}
