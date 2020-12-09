
import SwiftUI

/// View
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
	
	func fontSize(for size: CGSize) -> CGFloat {
		min(size.width, size.height) * 0.75
	}
	
	var body: some View {
		GeometryReader { geometry in
			body(for: geometry.size)
		}
	}
	
	@ViewBuilder
	private func body(for size: CGSize) -> some View {
		
		if card.isFaceUp || !card.isMatched {
			Text(card.content)
				.font(Font.system(size: fontSize(for: size)))
				.cardify(isFaceUp: card.isFaceUp)
		}
		
		
		
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
