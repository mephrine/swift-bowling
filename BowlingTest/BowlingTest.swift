//
//  BowlingTest.swift
//  BowlingTest
//
//  Created by Mephrine on 2021/12/01.
//

import XCTest

class BowlingTest: XCTestCase {
  func test_shouldBeStrikeWhenAllThePinsKnockedDownOnTheFirstBall() throws {
		let frame: Frame = NormalFrame()
		XCTAssertTrue(frame.score(of: Ball(knockedDownPin: 10) ) is Strike)
  }
}
