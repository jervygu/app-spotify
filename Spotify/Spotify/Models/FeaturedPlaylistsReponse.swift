//
//  FeaturedPlaylistsReponse.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/16/21.
//

import Foundation

struct FeaturedPlaylistsReponse: Codable {
    let playlists: PlaylistsResponse
}

struct CategorysPlaylistsResponse: Codable {
    let playlists: PlaylistsResponse
}


struct PlaylistsResponse: Codable {
    let items: [Playlist]
}

struct Track: Codable {
    let href: String
    let total: Int
}

struct Owner: Codable {
    let display_name: String
    let external_urls: [String: String]
    let href: String
    let id: String
    let type: String
}

