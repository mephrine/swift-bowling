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
		let firstBall: Frame = NormalFrame()
		let secondBall = try firstBall.score(of: Ball(knockedDownPin: 7))
		
		XCTAssertTrue(try secondBall.score(of: Ball(knockedDownPin: 3)) is Spare)
	}
	
	func test_shouldBeMissWhenAllThePinsnNotKnockedDownOnTheSecondBall() throws {
		let firstBall: Frame = NormalFrame()
		let secondBall = try firstBall.score(of: Ball(knockedDownPin: 6))
		
		XCTAssertTrue(try secondBall.score(of: Ball(knockedDownPin: 3)) is Miss)
	}
	
	func test_shouldBeGutterWhenNoneOfThePinsnNotingKnockedDown() throws {
		let firstBall: Frame = NormalFrame()
		let secondBall = try firstBall.score(of: Ball(knockedDownPin: 0))
		
		XCTAssertTrue(try secondBall.score(of: Ball(knockedDownPin: 0)) is Gutter)
	}
	
	func test_shouldBeFrame2WhenFrame1Ends() throws {
		let bowlingGame = BowlingGame()
		bowlingGame.play(with: Ball(knockedDownPin: 0))
		bowlingGame.play(with: Ball(knockedDownPin: 0))
		
		XCTAssertTrue(bowlingGame.frames.count == 2)
	}
}
