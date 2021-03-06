//
//  AlbumDetailsResponse.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/18/21.
//

import Foundation

struct AlbumDetailsResponse: Codable {
    let album_type: String
    let artists: [Artist]
    let available_markets: [String]
    let external_urls: [String: String]
    let id: String
    let images: [APIImage]
    let label: String
    let name: String
    let popularity: Int?
    let release_date: String
//    let total_tracks: Int
    let tracks: TrackResponse
}

struct TrackResponse: Codable {
    let items: [AudioTrack]
    let total: Int
}
