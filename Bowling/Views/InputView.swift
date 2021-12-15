//
//  InputView.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/09.
//

import Foundation

protocol Inputtable {
	func inputedName() throws -> InputName
	func makeInputName() throws -> InputName
	func inputedBall(of currentFrame: Int) throws -> Ball
	func makeBall(of currentFrame: Int) throws -> Ball
}

extension Inputtable {
	func inputedName() throws -> InputName {
		return try makeInputName()
	}
	
	func inputedBall(of currentFrame: Int) throws -> Ball {
		return try makeBall(of: currentFrame)
	}
}

struct InputView: Inputtable {
	func makeInputName() throws -> InputName {
		print("플레이어 이름은(3 english letters)?:", terminator: " ")
		return try InputName(name: readLine())
	}
	
	func makeBall(of currentFrame: Int) throws -> Ball {
		print("\(currentFrame)프레임 투구 : ", terminator: " ")
		return try Ball(knockedDownPin: readLine())
	}
}
