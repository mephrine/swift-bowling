//
//  Miss.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/04.
//

import Foundation

struct Miss: Finished {
	let balls: [Ball]
	let isFinished: Bool

	static func makeNewFrame(byBalls balls: [Ball], marks: [String]) -> Miss {
		Miss(balls: balls, isFinished: true)
	}
}
