//
//  CurrentUserAlbumsResponse.swift
//  Spotify
//
//  Created by Jervy Umandap on 5/18/21.
//

import Foundation

struct CurrentUserAlbumsResponse: Codable {
    let items: [SavedAlbum]
}

struct SavedAlbum: Codable {
    let added_at: String
    let album: Album
}
