//
//  Album.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/20/21.
//

import Foundation


struct Album: Codable {
    let album_type: String
    let available_markets: [String]
    let id: String
    let images: [APIImage]
    let name: String
    let release_date: String
    let total_tracks: Int
    let artists: [Artist]
    let external_urls: [String: String]
}
