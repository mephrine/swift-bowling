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
		let inputView = StubInputView(name: "abc")
		let bowlingGame = BowlingGame(inputView: inputView)
		bowlingGame.play(with: Ball(knockedDownPin: 0))
		bowlingGame.play(with: Ball(knockedDownPin: 0))
		
		XCTAssertTrue(bowlingGame.frames.count == 2)
	}
	
	func test_shouldBeFinalFrameWhenFrame9Ends() throws {
		let bowlingGame = makeBowlingGameOfFinalFrame()
		
		XCTAssertTrue(bowlingGame.frames.last is FinalFrame)
	}
	
	func test_shouldGet3BallsWhenFinalFrameContainsStrikeOrSpare() throws {
		var bowlingGame = makeBowlingGameOfFinalFrame()
		
		bowlingGame.play(with: Ball(knockedDownPin: 10))
		bowlingGame.play(with: Ball(knockedDownPin: 10))
		bowlingGame.play(with: Ball(knockedDownPin: 10))
		
		XCTAssertTrue(bowlingGame.frames.last?.balls.count == 3)
		
		bowlingGame = makeBowlingGameOfFinalFrame()
		
		bowlingGame.play(with: Ball(knockedDownPin: 1))
		bowlingGame.play(with: Ball(knockedDownPin: 9))
		bowlingGame.play(with: Ball(knockedDownPin: 1))
		
		XCTAssertTrue(bowlingGame.frames.last?.balls.count == 3)
	}
	
	func test_shouldThrowErrorWhenTheInputNameIsInvalid() throws {
		var bowlingGame = makeStubBowlingGame(byName: "a")
		XCTAssertThrowsError(try bowlingGame.enterGame()) { error in
			XCTAssertEqual(error as! BowlingError, BowlingError.invalidName)
		}
		
		bowlingGame = makeStubBowlingGame(byName: "")
		XCTAssertThrowsError(try bowlingGame.enterGame()) { error in
			XCTAssertEqual(error as! BowlingError, BowlingError.invalidName)
		}
		
		bowlingGame = makeStubBowlingGame(byName: nil)
		XCTAssertThrowsError(try bowlingGame.enterGame()) { error in
			XCTAssertEqual(error as! BowlingError, BowlingError.invalidName)
		}
		
		bowlingGame = makeStubBowlingGame(byName: "abcd")
		XCTAssertThrowsError(try bowlingGame.enterGame()) { error in
			XCTAssertEqual(error as! BowlingError, BowlingError.invalidName)
		}
	}
	
	func test_shouldThrowErrorWhenTheInputBallIsInvalid() throws {
		var bowlingGame = makeStubBowlingGame(byName: "abc", balls: [Ball(knockedDownPin: "-1")])
		XCTAssertThrowsError(try bowlingGame.enterGame()) { error in
			XCTAssertEqual(error as! BowlingError, BowlingError.invalidBall)
		}
		
		bowlingGame = makeStubBowlingGame(byName: "abc", balls: [Ball(knockedDownPin: "a")])
		XCTAssertThrowsError(try bowlingGame.enterGame()) { error in
			XCTAssertEqual(error as! BowlingError, BowlingError.invalidBall)
		}
		
		bowlingGame = makeStubBowlingGame(byName: "abc", balls: [Ball(knockedDownPin: "11")])
		XCTAssertThrowsError(try bowlingGame.enterGame()) { error in
			XCTAssertEqual(error as! BowlingError, BowlingError.invalidBall)
		}
	}
	
	private func makeStubBowlingGame(byName name: String?, balls: [Ball] = []) -> BowlingGame {
		let inputView = StubInputView(name: name, balls: balls)
		let bowlingGame = BowlingGame(inputView: inputView)
		return bowlingGame
	}
	
	private func makeBowlingGameOfFinalFrame() -> BowlingGame {
		let inputView = StubInputView(name: "ab")
		let bowlingGame = BowlingGame(inputView: inputView)
		for _ in 0 ..< 9 {
			bowlingGame.play(with: Ball(knockedDownPin: 10))
		}
		return bowlingGame
	}
}
