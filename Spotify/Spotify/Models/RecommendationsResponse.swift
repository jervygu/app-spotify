//
//  RecommendationsResponse.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/16/21.
//

import Foundation

struct RecommendationsResponse: Codable {
    let seeds: [String: String]
    let tracks: [Track]
}

struct RecommendedTrack: Codable {
    let album: [Album]
}

