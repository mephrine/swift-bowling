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
	case exceedMaxPin
}

extension BowlingError: LocalizedError {
	var errorDescription: String? {
		switch self {
		case .invalidName:
			return "이름은 3글자로만 입력 가능합니다."
		case .invalidBall:
			return "공은 0~10만 입력 가능합니다."
		case .exceedMaxPin:
			return "남아있는 볼링 핀보다 많은 핀을 입력할 수 없습니다."
		}
	}
}
