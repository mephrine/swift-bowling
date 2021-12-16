//
//  NormalFrameStrike.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/02.
//

import Foundation

struct NormalFrameStrike: Finished {
	let balls: [Ball]
	let isFinished: Bool
	let scoreMark: String = "  X"
	
	static func makeNewFrame(byBalls balls: [Ball], marks: [String]) -> NormalFrameStrike {
		NormalFrameStrike(balls: balls, isFinished: true)
	}
}
