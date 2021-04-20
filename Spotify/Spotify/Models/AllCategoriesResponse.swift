//
//  AllCategoriesResponse.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/20/21.
//

import Foundation

struct AllCategoriesResponse: Codable {
    let categories: Categories
}

struct Categories: Codable {
    let items: [Category]
    let total: Int
}

struct Category: Codable {
    let href: String
    let id: String
    let name: String
    let icons: [APIImage]
}
