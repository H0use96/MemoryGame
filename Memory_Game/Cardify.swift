//
//  Cardify.swift
//  Memory_Game
//
//  Created by KHU_Taewoo on 2020/11/22.
//

import SwiftUI

struct Cardify: ViewModifier {
	
	var isFaceup: Bool
	
	let cornerRadius: CGFloat = 10
	let edgeLineWidth: CGFloat = 3
	
	
	func body(content: Content) -> some View {
		
		ZStack {
			if isFaceup {
				RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
				RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
				Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(60-90), clockwise: true)
					.opacity(0.6)
					.padding(5)
				content
			} else {
				RoundedRectangle(cornerRadius: cornerRadius).fill()
			}
		}

	}
}

extension View {
	func cardify(isFaceUp: Bool) -> some View {
		self.modifier(Cardify(isFaceup: isFaceUp))
	}
}
