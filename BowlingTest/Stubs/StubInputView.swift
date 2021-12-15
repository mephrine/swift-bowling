//
//  StubInputView.swift
//  BowlingTest
//
//  Created by Mephrine on 2021/12/09.
//

import Foundation

final class StubInputView: Inputtable {
	let name: String?
	var balls: [String?]
	
	init(name: String?, balls: [String?]) {
		self.name = name
		self.balls = balls
	}
	
	func makeInputName() throws -> InputName {
		try InputName(name: name)
	}
	
	func makeBall(of currentFrame: Int) throws -> Ball {
		try Ball(knockedDownPin: balls.remove(at: 0))
	}
}
