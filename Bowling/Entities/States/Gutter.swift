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
	
	static func makeNewFrame(from currentframe: Frame, balls: [Ball]) -> Gutter {
		Gutter(balls: balls, isFinished: true)
	}
}
