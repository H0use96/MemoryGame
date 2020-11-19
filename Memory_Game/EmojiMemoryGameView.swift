
import SwiftUI

struct EmojiMemoryGameView: View {
    
	@ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
		Grid(viewModel.cards) { card in
			CardView(card: card).onTapGesture {
				viewModel.choose(card: card)
			}
			.padding()
		}
		.padding()
		.foregroundColor(Color.orange)
		.background(Color.black)
		.font(.largeTitle)
	}
}

struct CardView: View {
	let card: MemoryGmae<String>.Card
	
	let cornerRadius: CGFloat = 10
	let edgeLineWidth: CGFloat = 3
	
	func fontSize(for size: CGSize) -> CGFloat {
		min(size.width, size.height) * 0.75
	}
	
	var body: some View {
		GeometryReader { geometry in
			body(for: geometry.size)
		}
	}
	
	private func body(for size: CGSize) -> some View {
		ZStack {
			if card.isFaceUp {
				RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
				RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
				Text(card.content)
			} else {
				RoundedRectangle(cornerRadius: cornerRadius).fill()
			}
		}
		.font(Font.system(size: fontSize(for: size)))
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
