
import SwiftUI

@main
struct Memory_GameApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: EmojiMemoryGame())
        }
    }
}

struct Memory_GameApp_Previews: PreviewProvider {
	static var previews: some View {
		Group {
			EmojiMemoryGameView(viewModel: EmojiMemoryGame())
		}
	}
}
