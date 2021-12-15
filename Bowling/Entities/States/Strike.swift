//
//  Strike.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/02.
//

import Foundation

struct Strike: Finished {
	let balls: [Ball]
	let isFinished: Bool
	let mark: String = " X  "
	
	static func makeNewFrame(from currentframe: Frame, balls: [Ball]) -> Strike {
		Strike(balls: balls, isFinished: isFinished(frame: currentframe, balls: balls))
	}
	
	private static func isFinished(frame: Frame, balls: [Ball]) -> Bool {
		if frame is FinalFrame { return balls.count == 3 }
		return true
	}
}
