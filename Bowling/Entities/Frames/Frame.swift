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
	var scoreMark: String { " \(balls.convertToScoreMark) " }
}

protocol Finished: Frame {
}

extension Finished {
	var marks: [String] { [] }
	var scoreMark: String { " \(balls.convertToScoreMark) " }
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
		var marks = self.marks
		if ball.isStrike {
			marks.append("X")
			return FinalFrameStrike.makeNewFrame(byBalls: balls, marks: marks)
		}
		
		if balls.isSpare {
			guard let firstBall = balls.first else {
				return FinalFrameSpare.makeNewFrame(byBalls: balls, marks: marks)
			}
			marks = ["\(firstBall.knockedDownPin)|/"]
			return FinalFrameSpare.makeNewFrame(byBalls: balls, marks: marks)
		}
		if balls.isMiss {
			guard balls.sumOfBalls <= BowlingOption.numberOfPins else {
				throw BowlingError.exceedMaxPin
			}
			marks = [balls.convertToScoreMark]
			return Miss.makeNewFrame(byBalls: balls, marks: self.marks)
		}
		if balls.isGutter {
			guard balls.sumOfBalls <= BowlingOption.numberOfPins else {
				throw BowlingError.exceedMaxPin
			}
			marks = [balls.convertToScoreMark]
			return Gutter.makeNewFrame(byBalls: balls, marks: self.marks)
		}
		marks.append(ball.convertToMark)
		return Self.makeNewFrame(byBalls: balls, marks: marks)
	}
}
