//
//  AuthManager.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/15/21.
//
// client ID: 43db0c8fac104023a77aace978575ab9
// client secret: 95a021ef785741b4a87995628e2e18e2
// https://jervygu.wixsite.com/iosdev?code=AQCZJ74LcqE3wkYFcDfgiLS-PWawe8pLIqsXA59AGKV7hif6iQ8tdRKausZzfNuJBaybFvqzzxtvvePlSmDNL7T6Z50RGuf0MXWlV7QsR3Yav9RPjedeX0BM51W53yMqBpfWzJUKAZE1qg1-KpaLVCWeV09v0XxNgMxw1r9qK5piOn2bkGD3HTQhZSkR-H9qTDeRqyyvfkuK


import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    struct Constants {
        static let clientID = "43db0c8fac104023a77aace978575ab9"
        static let clientSecret = "95a021ef785741b4a87995628e2e18e2"
    }
    
    private init() {}
    
    public var signInURL: URL? {
        let base = "https://accounts.spotify.com/authorize"
        let scopes = "user-read-private"
        //        let redirectURI = "https://jervygu.github.io/"
        let redirectURI = "https://jervygu.wixsite.com/iosdev"
        
        let string = "\(base)?response_type=code&client_id=\(Constants.clientID)&scope=\(scopes)&redirect_uri=\(redirectURI)&show_dialog=true"
        return URL(string: string)
    }
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    
    private var refreshToken: String? {
        return nil
    }
    
    private var tokenExpirationDate: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
    
    public func exchangeCodeForToken(code: String, completion: @escaping((Bool) -> Void)) {
        //  Get token
        return
    }
    
    public func refreshAccessToken() {
        
    }
    
    private func cacheToken() {
        
    }
}
