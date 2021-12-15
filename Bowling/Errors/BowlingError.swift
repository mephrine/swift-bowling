//
//  BowlingError.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/09.
//

import Foundation

enum BowlingError: Error {
	case invalidName
	case invalidBall
}

extension BowlingError: LocalizedError {
	var errorDescription: String? {
		switch self {
		case .invalidName:
			return "이름은 3글자로만 입력 가능합니다."
		case .invalidBall:
			return "공은 0~10만 입력 가능합니다."
		}
	}
}
