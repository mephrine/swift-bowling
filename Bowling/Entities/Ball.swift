//
//  Ball.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/02.
//

import Foundation

struct Ball {
	let knockedDownPin: Int
	
	init(knockedDownPin: String?) throws {
		guard let validKnockedDownPin = knockedDownPin,
					let pinCount = Int(validKnockedDownPin),
					BowlingOption.scoreRange.contains(pinCount)
		else { throw BowlingError.invalidBall }
		
		self.knockedDownPin = pinCount
	}
}

extension Ball {
	var isStrike: Bool {
		self.knockedDownPin == BowlingOption.numberOfPins
	}
	
	var convertToMark: String {
		switch self.knockedDownPin {
		case 0: return "-"
		case 10: return "X"
		default: return String(describing: self.knockedDownPin)
		}
	}
}

extension Array where Element == Ball {
	var convertToScoreMark: String {
		self.map { ball in
			ball.convertToMark
		}.joined(separator: "|")
	}
	
	var isStrike: Bool {
		self.first?.knockedDownPin == BowlingOption.numberOfPins
	}
	
	var isSpare: Bool {
		guard isSecondFrame else { return false }
		let score = self
			.map { $0.knockedDownPin }
			.reduce(0) { result, ball in
				result + ball
			}
		return score == BowlingOption.numberOfPins
	}
	
	var isMiss: Bool {
		guard isSecondFrame else { return false }
		let score = self
			.map { $0.knockedDownPin }
			.reduce(0) { result, ball in
				result + ball
			}
		return score < BowlingOption.numberOfPins && score > 0
	}
	
	var isGutter: Bool {
		guard isSecondFrame else { return false }
		let score = self
			.map { $0.knockedDownPin }
			.reduce(0) { result, ball in
				result + ball
			}
		return score == 0
	}
	
	var isSecondFrame: Bool {
		self[safe: 1] != nil
	}
}
