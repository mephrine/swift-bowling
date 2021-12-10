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
	func inputedBall() throws -> Ball
	func makeBall() throws -> Ball
}

extension Inputtable {
	func inputedName() throws -> InputName {
		return try makeInputName()
	}
	
	func inputedBall() throws -> Ball {
		return try makeBall()
	}
}

struct InputView: Inputtable {
	func makeInputName() throws -> InputName {
		print("플레이어 이름은(3 english letters)?:")
		return try InputName(name: readLine())
	}
	
	func makeBall() throws -> Ball {
		return try Ball(knockedDownPin: readLine())
	}
}
