//
//  AuthResponse.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/15/21.
//

import Foundation

struct AuthResponse: Codable {
    let access_token: String
    let expires_in: Int
    let refresh_token: String?
    let scope: String
    let token_type: String
    
}



//SUCCESS: {
//    "access_token" = "BQBYqaq2l6rOK_B9FML5tX1diFTwmyzdxzH_YgcTAhfnFxMapXKXD-BG-6DYjQHP6J6dDn6wJr2j503bht3BadW0YfyNrVkaUPbhUvrbU_7F3Fz2VYyQBwAP1n0RXsvrKMoDJh-svZCDsPFSQjtA_VNHY5wr";
//    "expires_in" = 3600;
//    "refresh_token" = "AQCRjky_NNiVaGJkzM51efLbBOycy38gzE9XxjNaPLWmL40WPPGZwiOiJYp1Ox0qa4l5uAIOJQh9s4ROF54xz8IhHVdcNRc13Pw0V360r9hWsbMuyZOCViuHwDaGtKEeEbo";
//    scope = "user-read-private";
//    "token_type" = Bearer;
//}
