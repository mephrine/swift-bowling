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
	var scoreMark: String { get }
	var marks: [String] { get }
	func score(of ball: Ball) throws -> Frame
	static func makeNewFrame(byBalls balls: [Ball], marks: [String]) -> Self
}

extension Frame {
	func score(of ball: Ball) throws -> Frame {
		let balls = self.balls + [ball]
		guard balls.sumOfBalls <= BowlingOption.numberOfPins else {
			throw BowlingError.exceedMaxPin
		}
		return Self.makeNewFrame(byBalls: balls, marks: marks)
	}
}

protocol Running: Frame {
}

extension Running {
	var isFinished: Bool { false }
	var marks: [String] { [] }
	var scoreMark: String { "  \(balls.convertToScoreMark)" }
}

protocol Finished: Frame {
}

extension Finished {
	var marks: [String] { [] }
	var scoreMark: String { "  \(balls.convertToScoreMark)" }
}

protocol Final: Frame {
	
}

extension Final {
	static func isFinished(balls: [Ball]) -> Bool {
		 balls.count == 3
	}
	
	var scoreMark: String {
		let mark = marks
			.joined(separator: "|")
		return "\(mark)"
	}
	
	func score(of ball: Ball) throws -> Frame {
		let balls = self.balls + [ball]
		if ball.isStrike { return makeStrike(by: balls, marks: marks) }
		if balls.isSpare { return makeSpare(by: balls, marks: marks) }
		if balls.isMiss { return try makeMiss(by: balls) }
		if balls.isGutter { return try makeGutter(by: balls) }
		return makeFinalFrame(by: balls, currentMarks: marks)
	}
	
	func makeStrike(by balls: [Ball], marks: [String]) -> FinalFrameStrike {
		var marks = self.marks
		marks.append("X")
		return FinalFrameStrike.makeNewFrame(byBalls: balls, marks: marks)
	}
	
	func makeSpare(by balls: [Ball], marks: [String]) -> FinalFrameSpare {
		guard let firstBall = balls.first else {
			return FinalFrameSpare.makeNewFrame(byBalls: balls, marks: marks)
		}
		var marks = self.marks
		marks = ["\(firstBall.knockedDownPin)|/"]
		return FinalFrameSpare.makeNewFrame(byBalls: balls, marks: marks)
	}
	
	func makeMiss(by balls: [Ball]) throws -> Miss {
		guard balls.sumOfBalls <= BowlingOption.numberOfPins else {
			throw BowlingError.exceedMaxPin
		}
		let marks =  [balls.convertToScoreMark]
		return Miss.makeNewFrame(byBalls: balls, marks: marks)
	}
	
	func makeGutter(by balls: [Ball]) throws -> Gutter {
		guard balls.sumOfBalls <= BowlingOption.numberOfPins else {
			throw BowlingError.exceedMaxPin
		}
		let marks = [balls.convertToScoreMark]
		return Gutter.makeNewFrame(byBalls: balls, marks: marks)
	}
	
	func makeFinalFrame(by balls: [Ball], currentMarks: [String]) -> FinalFrame {
		var marks = currentMarks
		guard let currentBowlingBall = balls.last else { return FinalFrame.makeNewFrame(byBalls: balls, marks: currentMarks) }
		marks.append(currentBowlingBall.convertToMark)
		return FinalFrame.makeNewFrame(byBalls: balls, marks: marks)
	}
}
