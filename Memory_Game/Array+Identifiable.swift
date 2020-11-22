//
//  Array+Identiable.swift
//  Memory_Game
//
//  Created by KHU_Taewoo on 2020/11/21.
//

import Foundation

extension Array where Element: Identifiable {
	
	func findFirstOne(of item: Element) -> Int? {
		
		for index in 0..<self.count {
			if self[index].id == item.id {
				return index
			}
		}
		
		return nil
	}
}

extension Array {
	var only: Element? {
		return self.count == 1 ? first : nil
	}
}
