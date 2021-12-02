//
//  Frame.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/02.
//

import Foundation

protocol Frame {
	func score(of ball: Ball) -> Frame?
}

extension Frame {
	func score(of ball: Ball) -> Frame? {
		if ball.isStrike { return Strike() }
		return nil
	}
}
