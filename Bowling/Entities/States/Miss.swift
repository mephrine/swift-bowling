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
	var mark: String {
		let mark = balls
			.map { $0.knockedDownPin }
			.map(String.init)
			.joined(separator: "|")
		return " \(mark) "
	}

	static func makeNewFrame(from currentframe: Frame, balls: [Ball]) -> Miss {
		Miss(balls: balls, isFinished: true)
	}
}
