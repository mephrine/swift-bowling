//
//  Frame.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/02.
//

import Foundation

protocol Frame {
	var balls: [Ball] { get }
	func score(of ball: Ball) throws -> Frame
}

extension Frame {
	func score(of ball: Ball) throws -> Frame {
		return self
	}
}
