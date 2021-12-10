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
		playerName = try inputView.inputedName().name
		try bowling()
	}
	
	func play(with ball: Ball) {
		do {
			guard let currentFrame = try frames.last?.score(of: ball) else { return }
			try manage(of: currentFrame)
		} catch {
			fatalError("Ball is invalid")
		}
	}
	
	private func bowling() throws {
		play(with: try inputView.inputedBall())
	}
	
	private func manage(of frame: Frame) throws {
		changeCurrentFrameTo(frame)
		if frame.isFinished {
			try manageGame()
			return
		}
		try bowling()
	}
	
	private func changeCurrentFrameTo(_ frame: Frame) {
		self.frames[frames.count - 1] = frame
	}
	
	private func manageGame() throws {
		if isLastFrame == false {
			makeNewFrame()
			try bowling()
		}
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
