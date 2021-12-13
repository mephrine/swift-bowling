//
//  BowlingTest.swift
//  BowlingTest
//
//  Created by Mephrine on 2021/12/01.
//

import XCTest

class BowlingTest: XCTestCase {
	let resultView = StubResultView()
	
	func test_shouldBeStrikeWhenAllThePinsKnockedDownOnTheFirstBall() throws {
		let frame = NormalFrame()
		XCTAssertTrue(try frame.score(of: Ball(knockedDownPin: "10")) is Strike)
	}
	
	func test_shouldBeSpareWhenAllThePinsKnockedDownOnTheSecondBall() throws {
		let firstBall: Frame = NormalFrame()
		let secondBall = try firstBall.score(of: Ball(knockedDownPin: "7"))
		
		XCTAssertTrue(try secondBall.score(of: Ball(knockedDownPin: "3")) is Spare)
	}
	
	func test_shouldBeMissWhenAllThePinsnNotKnockedDownOnTheSecondBall() throws {
		let firstBall: Frame = NormalFrame()
		let secondBall = try firstBall.score(of: Ball(knockedDownPin: "6"))
		
		XCTAssertTrue(try secondBall.score(of: Ball(knockedDownPin: "3")) is Miss)
	}
	
	func test_shouldBeGutterWhenNoneOfThePinsnNotingKnockedDown() throws {
		let firstBall: Frame = NormalFrame()
		let secondBall = try firstBall.score(of: Ball(knockedDownPin: "0"))
		
		XCTAssertTrue(try secondBall.score(of: Ball(knockedDownPin: "0")) is Gutter)
	}
	
//	func test_shouldBeFrame2WhenFrame1Ends() throws {
//		let inputView = StubInputView(name: "abc", balls: ["0","0"])
//		let bowlingGame = BowlingGame(inputView: inputView)
//
//		XCTAssertTrue(bowlingGame.frames.count == 2)
//	}
//	
//	func test_shouldBeFinalFrameWhenFrame9Ends() throws {
//		let bowlingGame = makeBowlingGameOfFinalFrame()
//		try bowlingGame.enterGame()
//
//		XCTAssertTrue(bowlingGame.frames.last is FinalFrame)
//	}
//
//	func test_shouldGet3BallsWhenFinalFrameContainsStrikeOrSpare() throws {
//		var bowlingGame = makeBowlingGameOfFinalFrame()
//		try bowlingGame.enterGame()
//
//		bowlingGame.play(with: try Ball(knockedDownPin: "10"))
//		bowlingGame.play(with: try Ball(knockedDownPin: "10"))
//		bowlingGame.play(with: try Ball(knockedDownPin: "10"))
//
//		XCTAssertTrue(bowlingGame.frames.last?.balls.count == 3)
//
//		bowlingGame = makeBowlingGameOfFinalFrame()
//		try bowlingGame.enterGame()
//
//		bowlingGame.play(with: try Ball(knockedDownPin: "1"))
//		bowlingGame.play(with: try Ball(knockedDownPin: "9"))
//		bowlingGame.play(with: try Ball(knockedDownPin: "1"))
//
//		XCTAssertTrue(bowlingGame.frames.last?.balls.count == 3)
//	}
	
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
		var bowlingGame = makeStubBowlingGame(byName: "abc", balls: ["-1"])
		XCTAssertThrowsError(try bowlingGame.enterGame()) { error in
			XCTAssertEqual(error as! BowlingError, BowlingError.invalidBall)
		}
		
		bowlingGame = makeStubBowlingGame(byName: "abc", balls: [nil])
		XCTAssertThrowsError(try bowlingGame.enterGame()) { error in
			XCTAssertEqual(error as! BowlingError, BowlingError.invalidBall)
		}
		
		bowlingGame = makeStubBowlingGame(byName: "abc", balls: ["a"])
		XCTAssertThrowsError(try bowlingGame.enterGame()) { error in
			XCTAssertEqual(error as! BowlingError, BowlingError.invalidBall)
		}
		
		bowlingGame = makeStubBowlingGame(byName: "abc", balls: ["11"])
		XCTAssertThrowsError(try bowlingGame.enterGame()) { error in
			XCTAssertEqual(error as! BowlingError, BowlingError.invalidBall)
		}
	}
	
	func test_shouldPrintOutOfScoreBoardWhenTheBowlingGameIsStart() throws {
		let bowlingGame = makeStubBowlingGame(byName: "abc", balls: ["10","10","10","10","10","10","10","10","10","1","2"])
		try bowlingGame.enterGame()
		
		XCTAssertEqual(StubResultView.Verify.showGameBoard, true)
	}
	
	private func makeStubBowlingGame(byName name: String?, balls: [String?] = []) -> BowlingGame {
		let inputView = StubInputView(name: name, balls: balls)
		let bowlingGame = BowlingGame(inputView: inputView, resultView: resultView)
		return bowlingGame
	}
	
	private func makeBowlingGameOfFinalFrame() -> BowlingGame {
		let balls = (0 ..< 8).reduce(["10"]) { partialResult, _ in
			partialResult + ["10"]
		}
		let inputView = StubInputView(name: "abc", balls: balls)
		let bowlingGame = BowlingGame(inputView: inputView, resultView: resultView)
		
		return bowlingGame
	}
}
