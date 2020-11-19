//
//  Grid.swift
//  Memory_Game
//
//  Created by KHU_Taewoo on 2020/11/19.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View{
	
	var items: [Item]
	var viewForItem: (Item) -> ItemView
	
	init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
		self.items = items
		self.viewForItem = viewForItem
	}
	
	var body: some View {
		GeometryReader {geometry in
			bodyAboutContainer(for: GridLayout(itemCount: items.count, in: geometry.size))
		}
	}
	
	
	func bodyAboutContainer(for layout: GridLayout) -> some View {
		ForEach(items) { item in
			bodyAboutItem(for: item, in: layout)
		}
	}
	
	
	func bodyAboutItem(for item: Item, in layout: GridLayout) -> some View {
		let index = self.index(of: item)
		return viewForItem(item)
			.frame(width: layout.itemSize.width, height: layout.itemSize.height)
			.position(layout.location(ofItemAt: index))
	}
	
	func index(of item: Item) -> Int {
		for index in 0..<items.count {
			if items[index].id == item.id {
				return index
			}
		}
		
		return -1
	}
}
