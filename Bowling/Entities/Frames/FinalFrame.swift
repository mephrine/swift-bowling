//
//  FinalFrame.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/06.
//

import Foundation

struct FinalFrame: Final {
	let balls: [Ball]
	var isFinished: Bool = false
	let marks: [String]
	
	init(balls: [Ball] = [], marks: [String] = []) {
		self.balls = balls
		self.marks = marks
	}
	
	static func makeNewFrame(byBalls balls: [Ball], marks: [String]) -> FinalFrame {
		return FinalFrame(balls: balls, marks: marks)
	}
}
