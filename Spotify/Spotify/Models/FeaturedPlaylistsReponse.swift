//
//  FeaturedPlaylistsReponse.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/16/21.
//

import Foundation

struct FeaturedPlaylistsReponse: Codable {
    let playlists: PlaylistsResponse
}


struct PlaylistsResponse: Codable {
    let items: [Playlist]
}

struct Playlist: Codable {
    let description: String
    let external_urls: [String: String]
    let id: String
    let images: [APIImage]
    let name: String
    let tracks: Track
    
    let owner: Owner
    
}

struct Track: Codable {
    let href: String
    let total: Int
}

struct Owner: Codable {
    let display_name: String
    let external_urls: [String: String]
    let href: String
    let id: String
    let type: String
}




//
//{
//    message = "\U30a8\U30c7\U30a3\U30bf\U30fc\U306e\U304a\U3059\U3059\U3059\U3081";
//    playlists =     {
//        href = "https://api.spotify.com/v1/browse/featured-playlists?timestamp=2021-04-16T07%3A11%3A35&offset=0&limit=2";
//        items =         (
//            {
//                collaborative = 0;
//                description = "The very best in new music from around the world. Cover: Regard, Tate McRae, Troye Sivan ";
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/playlist/37i9dQZF1DWXJfnUiYjUKT";
//                };
//                href = "https://api.spotify.com/v1/playlists/37i9dQZF1DWXJfnUiYjUKT";
//                id = 37i9dQZF1DWXJfnUiYjUKT;
//                images =                 (
//                {
//                height = "<null>";
//                url = "https://i.scdn.co/image/ab67706f000000034c5f8564ca66496f9aaf2f04";
//                width = "<null>";
//                }
//                );
//                name = "New Music Friday";
//
//                owner = {
//                    "display_name" = Spotify;
//                    "external_urls" =                     {
//                        spotify = "https://open.spotify.com/user/spotify";
//                    };
//                    href = "https://api.spotify.com/v1/users/spotify";
//                    id = spotify;
//                    type = user;
//                    uri = "spotify:user:spotify";
//                };
//                "primary_color" = "<null>";
//                public = "<null>";
//                "snapshot_id" = MTYxODU0NTYwMCwwMDAwMDMxOTAwMDAwMTc4ZDhkNWU2YTYwMDAwMDE3OGQ3NWMwMzBl;
//                tracks =                 {
//                    href = "https://api.spotify.com/v1/playlists/37i9dQZF1DWXJfnUiYjUKT/tracks";
//                    total = 100;
//                };
//                type = playlist;
//                uri = "spotify:playlist:37i9dQZF1DWXJfnUiYjUKT";
//            },
//            {
//                collaborative = 0;
//                description = "Current favorites and exciting new music. Cover: Demi Lovato, Ariana Grande";
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/playlist/37i9dQZF1DXcRXFNfZr7Tp";
//                };
//                href = "https://api.spotify.com/v1/playlists/37i9dQZF1DXcRXFNfZr7Tp";
//                id = 37i9dQZF1DXcRXFNfZr7Tp;
//                images =                 (
//                {
//                height = "<null>";
//                url = "https://i.scdn.co/image/ab67706f00000003037d284d1eff615751b9ba50";
//                width = "<null>";
//                }
//                );
//                name = "just hits";
//                owner =                 {
//                    "display_name" = Spotify;
//                    "external_urls" =                     {
//                        spotify = "https://open.spotify.com/user/spotify";
//                    };
//                    href = "https://api.spotify.com/v1/users/spotify";
//                    id = spotify;
//                    type = user;
//                    uri = "spotify:user:spotify";
//                };
//                "primary_color" = "<null>";
//                public = "<null>";
//                "snapshot_id" = MTYxODU0NTYwMCwwMDAwMDRiMDAwMDAwMTc4ZDhkNWU2YjYwMDAwMDE3OGFmYjJmOTE2;
//                tracks =                 {
//                    href = "https://api.spotify.com/v1/playlists/37i9dQZF1DXcRXFNfZr7Tp/tracks";
//                    total = 101;
//                };
//                type = playlist;
//                uri = "spotify:playlist:37i9dQZF1DXcRXFNfZr7Tp";
//            }
//        );
//        limit = 2;
//        next = "https://api.spotify.com/v1/browse/featured-playlists?timestamp=2021-04-16T07%3A11%3A35&offset=2&limit=2";
//        offset = 0;
//        previous = "<null>";
//        total = 12;
//    };
//}
//
