//
//  SearchResult.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/20/21.
//

import Foundation

enum SearchResult {
    case artist(model: Artist)
    case album(model: Album)
    case track(model: AudioTrack)
    case playlist(model: Playlist)
}
