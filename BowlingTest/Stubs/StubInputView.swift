//
//  StubInputView.swift
//  BowlingTest
//
//  Created by Mephrine on 2021/12/09.
//

import Foundation

final class StubInputView: Inputtable {
	let name: String?
	
	init(name: String?) {
		self.name = name
	}
	
	func makeInputName() throws -> InputName {
		try InputName(name: name)
	}
}
