//
//  InputName.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/09.
//

import Foundation

struct InputName {
	let name: String
	
	init(name: String?) throws {
		guard let validName = name,
			name?.count == BowlingOption.numberOfNames
		else { throw BowlingError.invalidName }
		
		self.name = validName
	}
}
