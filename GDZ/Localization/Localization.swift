//
//  Localization.swift
//  GDZ
//
//  Created by Дмитрий on 12.03.2024.
//

import Foundation

private extension String {
    var localized: String {
        NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
struct Localization {
    static let booksTabTitle = "Books".localized
    static let myBooksTabTitle = "My books".localized
    static let favoritesTabTitle = "Favorites".localized
    static let searchTabTitle = "Search".localized
}
