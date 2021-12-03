//
//  Array+Extension.swift
//  Bowling
//
//  Created by Mephrine on 2021/12/04.
//

import Foundation

extension Array {
	subscript(safe index: Int) -> Element? {
		indices ~= index ? self[index] : nil
	}
}
