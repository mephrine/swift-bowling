//
//  Ball.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/02.
//

import Foundation

struct Ball {
	let knockedDownPin: Int
	
	var isStrike: Bool {
		knockedDownPin == 10
	}
}
