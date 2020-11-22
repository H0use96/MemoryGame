
import Foundation

/// Model
struct MemoryGmae<CardContent> where CardContent: Equatable{
    
    var cards: [Card]
	
	var chosenCardIndex: Int? {
		
		/// 이미 오픈되어 있는 카드가, 이전에 선택한 카드니깐
		get {
			return cards.indices.filter{idx in cards[idx].isFaceUp}.only
		}
		
		set(chosenIndex) {
			cards.indices.forEach { idx in cards[idx].isFaceUp = chosenIndex == idx }
		}
		
	}
    
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
		
		let inputIdxOptional = cards.findFirstOne(of: card)
		
		if let inputIdx = inputIdxOptional, !cards[inputIdx].isMatched, !cards[inputIdx].isFaceUp{
			if let chosenIdx = chosenCardIndex, !card.isMatched, !card.isFaceUp {
				if cards[chosenIdx].content == cards[inputIdx].content {
					cards[inputIdx].isMatched = true
					cards[chosenIdx].isMatched = true
				}
				
				cards[inputIdx].isFaceUp = true
			} else {
				chosenCardIndex = inputIdxOptional
			}
		}
		
		
	}
    
    
    struct Card: Identifiable{
        var id: Int
        var content: CardContent
        var isFaceUp = false
        var isMatched = false
    }
}
