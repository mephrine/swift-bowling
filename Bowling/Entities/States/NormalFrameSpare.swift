//
//  NormalFrameSpare.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/03.
//

import Foundation

struct NormalFrameSpare: Finished {
	let balls: [Ball]
	let isFinished: Bool
	var scoreMark: String {
		guard let firstBall = balls.first else { return "" }
		let mark = "\(firstBall.knockedDownPin)|/"
		return " \(mark) "
	}

	static func makeNewFrame(byBalls balls: [Ball], marks: [String]) -> NormalFrameSpare {
		NormalFrameSpare(balls: balls, isFinished: true)
	}
}
