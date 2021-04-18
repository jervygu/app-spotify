//
//  UserProfile.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/15/21.
//

import Foundation

struct UserProfile: Codable {
    let country: String
    let display_name: String
    let email: String
    let explicit_content: [String: Bool]
    let external_urls: [String: String]
    
    let followers: Follower?
    
    let id: String
    let product: String
    let images: [UserImage]
    
    var following: UserFollowingArtistsResponse?
    
    
}

struct Follower: Codable {
    let total: Int
}

struct UserImage: Codable {
    let url: String
    
}
 
