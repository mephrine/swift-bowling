//
//  BowlingGame.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/05.
//

import Foundation

final class BowlingGame {
	private(set) var frames: [Frame] = [NormalFrame()]
	
	func play(with ball: Ball) {
		do {
			guard let currentFrame = try frames.last?.score(of: Ball(knockedDownPin: 0)) else {	return }
			changeCurrentFrameTo(currentFrame)
			if currentFrame.isFinished { frames.append(NormalFrame()) }
		} catch {
			fatalError("Ball is invalid")
		}
	}
	
	private func changeCurrentFrameTo(_ frame: Frame) {
		self.frames[frames.count - 1] = frame
	}
}
