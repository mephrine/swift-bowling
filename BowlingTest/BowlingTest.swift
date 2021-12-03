//
//  BowlingTest.swift
//  BowlingTest
//
//  Created by Mephrine on 2021/12/01.
//

import XCTest

class BowlingTest: XCTestCase {
  func test_shouldBeStrikeWhenAllThePinsKnockedDownOnTheFirstBall() throws {
		let frame = NormalFrame()
		XCTAssertTrue(try frame.score(of: Ball(knockedDownPin: 10)) is Strike)
  }
	
	func test_shouldBeSpareWhenAllThePinsKnockedDownOnTheSecondBall() throws {
		let firstFrame: Frame = NormalFrame()
		let secondFrame = try firstFrame.score(of: Ball(knockedDownPin: 7))
		
		XCTAssertTrue(try secondFrame.score(of: Ball(knockedDownPin: 3)) is Spare)
	}
	
	func test_shouldBeMissWhenAllThePinsnNotKnockedDownOnTheSecondBall() throws {
		let firstFrame: Frame = NormalFrame()
		let secondFrame = try firstFrame.score(of: Ball(knockedDownPin: 6))
		
		XCTAssertTrue(try secondFrame.score(of: Ball(knockedDownPin: 3)) is Miss)
	}
}
