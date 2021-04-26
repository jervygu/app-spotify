//
//  CurrentUserPlaylistsResponse.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/17/21.
//

import Foundation


struct CurrentUserPlaylistsResponse: Codable {
    let items: [Playlist]
}
