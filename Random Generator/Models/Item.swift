//
//  Item.swift
//  Random Generator
//
//  Created by Erik Lightner on 3/31/22.
//

import Foundation

struct Item: Identifiable, Codable {
    var id = UUID()
    
    var category: Category
    var items: [Items]
    
    var isValid: Bool {
        !category.rawValue.isEmpty && !items.isEmpty
    }
    
    init(category: Category, items: [Items]) {
        self.category = category
        self.items = items
    }
}

enum Category: String, Codable {
    case name = ""
    
    init(name: String) {
        self = Category(rawValue: name) ?? .name
    }
}

struct Items: Codable {
    var name: String
}

extension Item {
    static let testItems: [Item] = [
        Item(
            category: Category(name: "Games"),
            items: [
                Items(name: "Cards Against Humanity"),
                Items(name: "Pictionary"),
                Items(name: "Twister")
            ]
        ),
        Item(
            category: Category(name: "Books"),
            items: [
                Items(name: "Harry Potter"),
                Items(name: "Magyk"),
                Items(name: "The Alchemyst")
            ]
        ),
        Item(
            category: Category(name: "Movies"),
            items: [
                Items(name: "The Avengers"),
                Items(name: "Black Widow"),
                Items(name: "Bastard Out of Carolina")
            ]
        )
    ]
}
