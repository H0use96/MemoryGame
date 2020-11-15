
import Foundation

struct MemoryGmae<CardContent> {
    
    var cards: [Card]
    
    init(numberOfPairsOfCard: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCard {
            let content = cardContentFactory(pairIndex)
			cards.append(Card(id: pairIndex*2, content: content))
			cards.append(Card(id: pairIndex*2 + 1, content: content))
        }
    }
	
	func index(of card: Card) -> Int {
		for index in 0..<cards.count {
			if cards[index].id == card.id {
				return index
			}
		}
		
		return 0
	}
	
	mutating func choose(card: Card) {
		let chosenIndex = index(of: card)
		cards[chosenIndex].isFaceUp.toggle()
	}
    
    
    struct Card: Identifiable{
        var id: Int
        var content: CardContent
        var isFaceUp = false
        var isMatched = false
    }
}
