//
//  UserFollowingResponse.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/17/21.
//

import Foundation

struct UserFollowingArtistsResponse: Codable {
    var artists: FollowingArtist
}

struct FollowingArtist: Codable {
    let items: [Artist]
    var total: Int
    
}


//{
//    artists =     {
//        cursors =         {
//            after = "<null>";
//        };
//        href = "https://api.spotify.com/v1/me/following?type=artist&limit=20";
//        items =         (
//                        {
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/artist/3TVXtAsR1Inumwj472S9r4";
//                };
//                followers =                 {
//                    href = "<null>";
//                    total = 54381251;
//                };
//                genres =                 (
//                    "canadian hip hop",
//                    "canadian pop",
//                    "hip hop",
//                    "pop rap",
//                    rap,
//                    "toronto rap"
//                );
//                href = "https://api.spotify.com/v1/artists/3TVXtAsR1Inumwj472S9r4";
//                id = 3TVXtAsR1Inumwj472S9r4;
//                images =                 (
//                                        {
//                        height = 640;
//                        url = "https://i.scdn.co/image/60cfab40c6bb160a1906be45276829d430058005";
//                        width = 640;
//                    },
//                                        {
//                        height = 320;
//                        url = "https://i.scdn.co/image/5ea794cf832550943d5f8122afcf5f23ee9d85b7";
//                        width = 320;
//                    },
//                                        {
//                        height = 160;
//                        url = "https://i.scdn.co/image/8eaace74aaca82eaccde400bbcab2653b9cf86e1";
//                        width = 160;
//                    }
//                );
//                name = Drake;
//                popularity = 98;
//                type = artist;
//                uri = "spotify:artist:3TVXtAsR1Inumwj472S9r4";
//            },
//                        {
//                "external_urls" =                 {
//                    spotify = "https://open.spotify.com/artist/69GGBxA162lTqCwzJG5jLp";
//                };
//                followers =                 {
//                    href = "<null>";
//                    total = 17726494;
//                };
//                genres =                 (
//                    "dance pop",
//                    edm,
//                    electropop,
//                    pop,
//                    "pop dance",
//                    "tropical house"
//                );
//                href = "https://api.spotify.com/v1/artists/69GGBxA162lTqCwzJG5jLp";
//                id = 69GGBxA162lTqCwzJG5jLp;
//                images =                 (
//                                        {
//                        height = 640;
//                        url = "https://i.scdn.co/image/960547a625bc2eb742bb3dd170cbc049d2e94cf9";
//                        width = 640;
//                    },
//                                        {
//                        height = 320;
//                        url = "https://i.scdn.co/image/9da714082fe9696529abadc8e4095451221b4483";
//                        width = 320;
//                    },
//                                        {
//                        height = 160;
//                        url = "https://i.scdn.co/image/caca64268346846a0753ca894b6ff92bb4dfb864";
//                        width = 160;
//                    }
//                );
//                name = "The Chainsmokers";
//                popularity = 85;
//                type = artist;
//                uri = "spotify:artist:69GGBxA162lTqCwzJG5jLp";
//            }
//        );
//        limit = 20;
//        next = "<null>";
//        total = 2;
//    };
//}
