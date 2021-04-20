//
//  NewReleasesReponse.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/16/21.
//

import Foundation

struct NewReleasesReponse: Codable {
    let albums: AlbumsResponse
}

struct AlbumsResponse: Codable {
    let items: [Album]
}


