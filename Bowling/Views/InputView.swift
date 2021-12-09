//
//  InputView.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/09.
//

import Foundation

protocol Inputtable {
	func inputed() throws -> InputName
	func makeInputName() throws -> InputName
}

extension Inputtable {
	func inputed() throws -> InputName {
		return try makeInputName()
	}
}

struct InputView: Inputtable {
	func makeInputName() throws -> InputName {
		print("플레이어 이름은(3 english letters)?:")
		return try InputName(name: readLine())
	}
}
