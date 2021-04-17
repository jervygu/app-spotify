//
//  Playlist.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/15/21.
//

import Foundation

struct Playlist: Codable {
    let description: String
    let external_urls: [String: String]
    let id: String
    let images: [APIImage]
    let name: String
    let tracks: Track
    let owner: Owner
}
