//
//  SettingsModels.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/15/21.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
