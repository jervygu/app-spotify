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
    let href: String
    let id: String
    let images: [APIImage]
    let name: String
    let owner: Owner
    let tracks: Track
    
    let type: String
}
