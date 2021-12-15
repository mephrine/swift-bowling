//
//  Spare.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/03.
//

import Foundation

struct Spare: Finished {
	let balls: [Ball]
	let isFinished: Bool
	var mark: String {
		let mark = balls
			.map { $0.knockedDownPin }
			.map(String.init)
			.joined(separator: "|")
		return " \(mark) "
	}
	
	static func makeNewFrame(from currentframe: Frame, balls: [Ball]) -> Spare {
		Spare(balls: balls, isFinished: isFinished(frame: currentframe, balls: balls))
	}
	
	private static func isFinished(frame: Frame, balls: [Ball]) -> Bool {
		if frame is FinalFrame { return balls.count == 3 }
		return true
	}
}
