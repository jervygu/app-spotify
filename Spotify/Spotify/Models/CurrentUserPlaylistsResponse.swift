//
//  CurrentUserPlaylistsResponse.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/17/21.
//

import Foundation


struct CurrentUserPlaylistsResponse: Codable {
    let items: [Playlist]?
}




//{
//    href = "https://api.spotify.com/v1/users/12179505490/playlists?offset=0&limit=20";
//    items =     (
//                {
//            collaborative = 0;
//            description = "";
//            "external_urls" =             {
//                spotify = "https://open.spotify.com/playlist/6K7jAqbRvNLH44O19lE3DL";
//            };
//            href = "https://api.spotify.com/v1/playlists/6K7jAqbRvNLH44O19lE3DL";
//            id = 6K7jAqbRvNLH44O19lE3DL;
//            images =             (
//                                {
//                    height = 640;
//                    url = "https://i.scdn.co/image/ab67616d0000b273f907de96b9a4fbc04accc0d5";
//                    width = 640;
//                }
//            );
//            name = Drake;
//            owner =             {
//                "display_name" = "Jervy Gu";
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/user/12179505490";
//                };
//                href = "https://api.spotify.com/v1/users/12179505490";
//                id = 12179505490;
//                type = user;
//                uri = "spotify:user:12179505490";
//            };
//            "primary_color" = "<null>";
//            public = 1;
//            "snapshot_id" = NSxmNWVmNTllZDVlNmU5ZDZhMjM5ZjlhMDVhN2Q0MzQxNWEwNzliNDBl;
//            tracks =             {
//                href = "https://api.spotify.com/v1/playlists/6K7jAqbRvNLH44O19lE3DL/tracks";
//                total = 3;
//            };
//            type = playlist;
//            uri = "spotify:playlist:6K7jAqbRvNLH44O19lE3DL";
//        },
//                {
//            collaborative = 0;
//            description = "";
//            "external_urls" =             {
//                spotify = "https://open.spotify.com/playlist/0h3thzy20gaOV2YIoeZomC";
//            };
//            href = "https://api.spotify.com/v1/playlists/0h3thzy20gaOV2YIoeZomC";
//            id = 0h3thzy20gaOV2YIoeZomC;
//            images =             (
//                                {
//                    height = 640;
//                    url = "https://mosaic.scdn.co/640/ab67616d0000b2730c7ca616433b7f0188305c2fab67616d0000b2738964912c414a1ca4d585d227ab67616d0000b2738e26bf4293c9da7a6439607bab67616d0000b273c822d7d07cf18f66c0c873e3";
//                    width = 640;
//                },
//                                {
//                    height = 300;
//                    url = "https://mosaic.scdn.co/300/ab67616d0000b2730c7ca616433b7f0188305c2fab67616d0000b2738964912c414a1ca4d585d227ab67616d0000b2738e26bf4293c9da7a6439607bab67616d0000b273c822d7d07cf18f66c0c873e3";
//                    width = 300;
//                },
//                                {
//                    height = 60;
//                    url = "https://mosaic.scdn.co/60/ab67616d0000b2730c7ca616433b7f0188305c2fab67616d0000b2738964912c414a1ca4d585d227ab67616d0000b2738e26bf4293c9da7a6439607bab67616d0000b273c822d7d07cf18f66c0c873e3";
//                    width = 60;
//                }
//            );
//            name = Tcs;
//            owner =             {
//                "display_name" = "Jervy Gu";
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/user/12179505490";
//                };
//                href = "https://api.spotify.com/v1/users/12179505490";
//                id = 12179505490;
//                type = user;
//                uri = "spotify:user:12179505490";
//            };
//            "primary_color" = "<null>";
//            public = 1;
//            "snapshot_id" = NiwxMjUyYmIxNDJkYjExNWJkNzcyMDAxMDQwZjg4YTdhNmZiZGRjZTc5;
//            tracks =             {
//                href = "https://api.spotify.com/v1/playlists/0h3thzy20gaOV2YIoeZomC/tracks";
//                total = 4;
//            };
//            type = playlist;
//            uri = "spotify:playlist:0h3thzy20gaOV2YIoeZomC";
//        }
//    );
//    limit = 20;
//    next = "<null>";
//    offset = 0;
//    previous = "<null>";
//    total = 2;
//}
//
