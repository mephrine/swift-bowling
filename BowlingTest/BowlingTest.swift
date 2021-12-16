//
//  BowlingTest.swift
//  BowlingTest
//
//  Created by Mephrine on 2021/12/01.
//

import XCTest

class BowlingTest: XCTestCase {
	let resultView = StubResultView()
	
	override func tearDownWithError() throws {
		resultView.clear()
	}
	
	func test_shouldBeStrikeWhenAllThePinsKnockedDownOnTheFirstBall() throws {
		let frame = NormalFrame()
		XCTAssertTrue(try frame.score(of: Ball(knockedDownPin: "10")) is NormalFrameStrike)
	}
	
	func test_shouldBeSpareWhenAllThePinsKnockedDownOnTheSecondBall() throws {
		let firstBall: Frame = NormalFrame()
		let secondBall = try firstBall.score(of: Ball(knockedDownPin: "7"))
		
		XCTAssertTrue(try secondBall.score(of: Ball(knockedDownPin: "3")) is NormalFrameSpare)
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

	func test_shouldGet3BallsWhenFinalFrameContainsStrikeOrSpare() throws {
		var bowlingGame = makeStubBowlingGame(byName: "abc", balls: ["10","10","10","10","10","10","10","10","10","10","10","10"])
		try bowlingGame.enterGame()

		XCTAssertTrue(bowlingGame.frames.last?.balls.count == 3)

		bowlingGame = makeStubBowlingGame(byName: "abc", balls: ["10","10","10","10","10","10","10","10","10","1","9","3"])
		try bowlingGame.enterGame()

		XCTAssertTrue(bowlingGame.frames.last?.balls.count == 3)
	}
	
	func test_shouldThrowErrorWhenTheInputNameIsInvalid() throws {
		var bowlingGame = makeStubBowlingGame(byName: "a")
		bowlingGame.enterGame()
		XCTAssertEqual(resultView.occuredError, BowlingError.invalidName)
		
		resultView.clear()
		bowlingGame = makeStubBowlingGame(byName: "")
		bowlingGame.enterGame()
		XCTAssertEqual(resultView.occuredError, BowlingError.invalidName)
		
		resultView.clear()
		bowlingGame = makeStubBowlingGame(byName: nil)
		bowlingGame.enterGame()
		XCTAssertEqual(resultView.occuredError, BowlingError.invalidName)
				
		resultView.clear()
		bowlingGame = makeStubBowlingGame(byName: "abcd")
		bowlingGame.enterGame()
		XCTAssertEqual(resultView.occuredError, BowlingError.invalidName)
		
	}
	
	func test_shouldThrowErrorWhenTheInputBallIsInvalid() throws {
		var bowlingGame = makeStubBowlingGame(byName: "abc", balls: ["-1"])
		bowlingGame.enterGame()
		XCTAssertEqual(resultView.occuredError, BowlingError.invalidBall)
		
		resultView.clear()
		bowlingGame = makeStubBowlingGame(byName: "abc", balls: [nil])
		bowlingGame.enterGame()
		XCTAssertEqual(resultView.occuredError, BowlingError.invalidBall)
		
		resultView.clear()
		bowlingGame = makeStubBowlingGame(byName: "abc", balls: ["a"])
		bowlingGame.enterGame()
		XCTAssertEqual(resultView.occuredError, BowlingError.invalidBall)

		resultView.clear()
		bowlingGame = makeStubBowlingGame(byName: "abc", balls: ["11"])
		bowlingGame.enterGame()
		XCTAssertEqual(resultView.occuredError, BowlingError.invalidBall)
	}
	
	func test_shouldPrintOutOfScoreBoardWhenTheBowlingGameIsStart() throws {
		let bowlingGame = makeStubBowlingGame(byName: "abc", balls: ["10","10","10","10","10","10","10","10","10","1","2"])
		try bowlingGame.enterGame()
		
		XCTAssertEqual(StubResultView.Verify.showGameBoardWhenGameStarts, true)
	}
	
	func test_shouldPrintOutTheNumberOfBallsOnTheScoreBoardWhenTheBallIsBowled() throws {
		let bowlingGame = makeStubBowlingGame(byName: "abc", balls: ["10","10","10","10","10","10","10","10","10","1","2"])
		try bowlingGame.enterGame()
		
		XCTAssertEqual(StubResultView.Verify.showScoreOnTheGameBoard, true)
		XCTAssertEqual(resultView.showingCount, 11)
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
