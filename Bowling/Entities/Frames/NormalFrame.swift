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
	
	func score(of ball: Ball) throws -> Frame {
		let balls = self.balls + [ball]
		if balls.isStrike { return NormalFrameStrike.makeNewFrame(byBalls: balls, marks: self.marks) }
		if balls.isSpare { return NormalFrameSpare.makeNewFrame(byBalls: balls, marks: self.marks) }
		if balls.isMiss { return Miss.makeNewFrame(byBalls: balls, marks: self.marks) }
		if balls.isGutter { return Gutter.makeNewFrame(byBalls: balls, marks: self.marks) }
		return Self.makeNewFrame(byBalls: balls, marks: self.marks)
	}
	
	static func makeNewFrame(byBalls balls: [Ball], marks: [String]) -> NormalFrame {
		return NormalFrame(balls: balls)
	}
}
