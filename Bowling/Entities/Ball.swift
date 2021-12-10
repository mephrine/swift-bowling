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
