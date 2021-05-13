//
//  DSGDefaults.swift
//  DSGEvents
//
//  Created by Padmaja U on 5/13/21.
//

import Foundation

private let favoritesKey = "favorites"

final class DSGDefaults {

    private var favorites = [Int]()

    static let shared = DSGDefaults()
    private init() {
        if let _favorites = UserDefaults.standard.array(forKey: favoritesKey) as? [Int] {
            favorites = _favorites
        } else {
            UserDefaults.standard.set(favorites, forKey: favoritesKey)
        }
    }

    func toggleFavourite(id: Int) {
        if favorites.contains(id) {
            favorites.removeAll(where: { $0 == id})
        } else {
            favorites.append(id)
        }
        UserDefaults.standard.set(favorites, forKey: favoritesKey)
        UserDefaults.standard.synchronize()
    }

    func isFavorite(id: Int) -> Bool {
        favorites.contains(id)
    }
}
