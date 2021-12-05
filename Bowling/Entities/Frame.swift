//
//  Frame.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/02.
//

import Foundation

protocol Frame {
	var balls: [Ball] { get }
	var isFinished: Bool { get }
	func score(of ball: Ball) throws -> Frame
}

extension Frame {
	func score(of ball: Ball) throws -> Frame {
		return self
	}
}


protocol Running: Frame {}

extension Running {
	var isFinished: Bool { false }
}

protocol Finished: Frame {}

extension Finished {
	var isFinished: Bool { true }
}
