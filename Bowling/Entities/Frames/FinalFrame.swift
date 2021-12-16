//
//  FinalFrame.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/06.
//

import Foundation

struct FinalFrame: Final {
	let balls: [Ball]
	let isFinished: Bool
	let marks: [String]
	
	init(balls: [Ball] = [], isFinished: Bool = false, marks: [String] = []) {
		self.balls = balls
		self.isFinished = isFinished
		self.marks = marks
	}
	
	static func makeNewFrame(byBalls balls: [Ball], marks: [String]) -> FinalFrame {
		return FinalFrame(balls: balls, isFinished: isFinished(balls: balls), marks: marks)
	}
}
