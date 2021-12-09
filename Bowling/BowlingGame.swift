//
//  BowlingGame.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/05.
//

import Foundation

final class BowlingGame {
	private(set) var frames: [Frame] = [NormalFrame()]
	let inputView: Inputtable
	var playerName = ""
	
	init(inputView: Inputtable) {
		self.inputView = inputView
		
	}
	
	func enterGame() throws {
		playerName = try inputView.inputed().name
	}
	
	func play(with ball: Ball) {
		do {
			guard let currentFrame = try frames.last?.score(of: ball) else {	return }
			changeCurrentFrameTo(currentFrame)
			if currentFrame.isFinished { manageGame() }
		} catch {
			fatalError("Ball is invalid")
		}
	}
	
	private func changeCurrentFrameTo(_ frame: Frame) {
		self.frames[frames.count - 1] = frame
	}
	
	private func manageGame() {
		if isLastFrame == false { makeNewFrame() }
	}
	
	private func makeNewFrame() {
		frames.append(shouldStartLastFrame ? FinalFrame() : NormalFrame())
	}
	
	private var shouldStartLastFrame: Bool {
		frames.count == 9
	}
	
	private var isLastFrame: Bool {
		frames.count == 10
	}
}
