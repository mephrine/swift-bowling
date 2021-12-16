//
//  Gutter.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/05.
//

import Foundation

struct Gutter: Finished {
	let balls: [Ball]
	let isFinished: Bool
	let scoreMark: String = "-"
	
	static func makeNewFrame(byBalls balls: [Ball], marks: [String]) -> Gutter {
		Gutter(balls: balls, isFinished: true)
	}
}
