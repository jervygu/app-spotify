//
//  PlaylistHeaderViewViewModel.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/18/21.
//

import Foundation

struct PlaylistHeaderViewViewModel: Codable {
    let name: String?
    let ownerName: String?
    let description: String?
    let artworkURL: URL?
    let total: Int?
}
