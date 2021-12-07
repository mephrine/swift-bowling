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
			guard let currentFrame = try frames.last?.score(of: ball) else {	return }
			changeCurrentFrameTo(currentFrame)
			if currentFrame.isFinished { makeNewFrame() }
		} catch {
			fatalError("Ball is invalid")
		}
	}
	
	private func changeCurrentFrameTo(_ frame: Frame) {
		self.frames[frames.count - 1] = frame
	}
	
	private func makeNewFrame() {
		frames.append(isLastFrame ? FinalFrame() : NormalFrame())
	}
	
	private var isLastFrame: Bool {
		frames.count == 9
	}
}
