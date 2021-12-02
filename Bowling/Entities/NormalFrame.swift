//
//  NormalFrame.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/02.
//

import Foundation

class NormalFrame: Frame {
	let balls: [Ball]
	
	init(balls: [Ball] = []) {
		self.balls = balls
	}
	
	func score(of ball: Ball) throws -> Frame {
		let balls = self.balls + [ball]
		if balls.isStrike { return Strike(balls: balls) }
		if balls.isSpare { return Spare(balls: balls) }
		return NormalFrame(balls: balls)
	}
	

}

fileprivate extension Array where Element == Ball {
	var isStrike: Bool {
		self.first?.knockedDownPin == BowlingOption.numberOfPins
	}
	
	var isSpare: Bool {
		let score = self
			.map { $0.knockedDownPin }
			.reduce(0) { result, ball in
				result + ball
			}
		return score == BowlingOption.numberOfPins
	}
}
