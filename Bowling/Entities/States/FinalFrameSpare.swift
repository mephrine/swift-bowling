//
//  FinalSpare.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/16.
//

import Foundation

struct FinalFrameSpare: Final {
	let balls: [Ball]
	let isFinished: Bool
	let marks: [String]
	
	static func makeNewFrame(byBalls balls: [Ball], marks: [String]) -> FinalFrameSpare {
		FinalFrameSpare(balls: balls, isFinished: isFinished(balls: balls), marks: marks)
	}
}
