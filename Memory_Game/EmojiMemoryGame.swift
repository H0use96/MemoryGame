
import SwiftUI

/// ViewModel
class EmojiMemoryGame: ObservableObject {
	
	@Published private var model: MemoryGmae<String> = createMemoryGame()
	
	var cards: [MemoryGmae<String>.Card] {
		model.cards
	}
	
	func choose(card: MemoryGmae<String>.Card) {
		print("hello")
		return model.choose(card: card)
	}
	
	
	static func createMemoryGame() -> MemoryGmae<String> {
		let emoji = ["😎", "🤬", "🤯"]
		return MemoryGmae<String>(numberOfPairsOfCard: emoji.count) {PairIndex in emoji[PairIndex]}
		
	}
	
}
