//
//  ItemData.swift
//  Random Generator
//
//  Created by Erik Lightner on 3/31/22.
//

import Foundation

class ItemData: ObservableObject {
    @Published var items = Item.testItems
    
    func items(for category: Category) -> [Item] {
        var filteredItems = [Item]()
        for item in items {
            if item.category == category {
                filteredItems.append(item)
            }
        }
        return filteredItems
    }
    
    func add(item: Item) {
        if item.isValid {
            items.append(item)
        }
    }
    
    func index(of item: Item) -> Int? {
        for i in items.indices {
            if items[i].id == item.id {
                return i
            }
        }
        return nil
    }
    
    private var itemsFileURL: URL {
        do {
            let documentsDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            return documentsDirectory.appendingPathComponent("itemData")
        }
        catch {
            fatalError("An error occurred while getting the url: \(error)")
        }
    }
    
    func saveItems() {
        do {
            let encodedData = try JSONEncoder().encode(items)
            try encodedData.write(to: itemsFileURL)
        }
        catch {
            fatalError("An error occurred while saving items: \(error)")
        }
    }
    
    func loadItems() {
        guard let data = try? Data(contentsOf: itemsFileURL) else { return }
        do {
            let savedItems = try JSONDecoder().decode([Item].self, from: data)
            items = savedItems
        }
        catch {
            fatalError("An error occurred while loading items: \(error)")
        }
    }
}
