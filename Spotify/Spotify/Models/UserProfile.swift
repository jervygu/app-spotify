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
    
//    let followers: [String: Codable?]
//    let followers: [String: Int]
    
    let id: String
    let product: String
    let images: [UserImage]
    
    
}

struct UserImage: Codable {
    let url: String
    
}
 
