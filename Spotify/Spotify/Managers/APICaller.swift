//
//  APICaller.swift
//  Spotify
//
//  Created by Jeff Umandap on 4/15/21.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    private init() {}
    
    struct Constants {
        static let baseAPIUrl = "https://api.spotify.com/v1"
    }
    
    enum APIError: Error {
        case failedToGetData
    }
    
    // MARK: -  Albums Details
    
    func getAlbumDetails(forAlbum album: Album, completion: @escaping(Result<AlbumDetailsResponse, Error>) -> Void) {
        createRequest(
            withUrl: URL(string: Constants.baseAPIUrl + "/albums/" + album.id),
            withType: .GET) { (request) in
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
//                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    let result = try JSONDecoder().decode(AlbumDetailsResponse.self, from: data)
                    print(result)
                    completion(.success(result))
                } catch {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    
    // MARK: -  Playlists Details
    
    func getPlaylistDetails(withPlaylist playlist: Playlist, completion: @escaping(Result<PlaylistDetailsResponse, Error>) -> Void) {
        createRequest(
            withUrl: URL(string: Constants.baseAPIUrl + "/playlists/" + playlist.id),
            withType: .GET) { (request) in
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
//                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    let result = try JSONDecoder().decode(PlaylistDetailsResponse.self, from: data)
                    print(result)
                    completion(.success(result))
                } catch {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    
    // MARK:- UserPlaylist
    
    public func getCurrentUserPlaylists(completion: @escaping(Result<[Playlist], Error>) -> Void) {
        createRequest(withUrl: URL(string: Constants.baseAPIUrl + "/me/playlists/?limit=50"), withType: .GET) { (request) in
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
//                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    let result = try JSONDecoder().decode(CurrentUserPlaylistsResponse.self, from: data)
//                    print(result)
                    completion(.success(result.items))
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    public func createPlaylist(withName name: String, completion: @escaping(Bool) -> Void) {
        getCurrentUserProfile { [weak self] (result) in
            switch result {
            case .success(let profile):
                let urlString = Constants.baseAPIUrl + "/users/\(profile.id)/playlists"
                
                self?.createRequest(withUrl: URL(string: urlString), withType: .POST) { (baseRequest) in
                    var request = baseRequest
                    let json = [
                        "name": name
                    ]
                    
                    request.httpBody = try? JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed)
                    
                    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                        guard let data = data, error == nil else {
                            completion(false)
                            return
                        }
                        do {
                            let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
//                            let result = try JSONDecoder().decode(Playlist.self, from: data)
                            if let response = result as? [String: Any], response["id"] as? String != nil {
                                print("Created!")
                                print(result)
                                completion(true)
                            } else {
                                print("Failed to get ID")
                                completion(false)
                            }
                            completion(true)
                            
                        } catch {
                            print(error.localizedDescription)
                            completion(false)
                        }
                    }
                    task.resume()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    public func addTrackToPlaylist(track: AudioTrack, playlist: Playlist, completion: @escaping(Bool) -> Void) {
        createRequest(withUrl: URL(string: Constants.baseAPIUrl + "/playlists/\(playlist.id)/tracks"), withType: .POST) {
            baseRequest in
            var request = baseRequest
            let json = [
                "uris": [
                    "spotify:track:\(track.id)"
                ]
            ]
            
            print(json)
            
            request.httpBody = try? JSONSerialization.data(withJSONObject: json, options: .fragmentsAllowed)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    completion(false)
                    return
                }
                
                do {
                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    
                    print(result)
                    
                    if let response = result as? [String: Any], response["snapshot_id"] as? String != nil {
                        completion(true)
                    } else {
                        completion(false)
                    }
                    
                } catch {
                    completion(false)
                }
            }
            task.resume()
            
        }
    }
    
    public func removeTrackFromPlaylist(track: AudioTrack, playlist: Playlist, completion: @escaping(Bool) -> Void) {
        
    }




// MARK: -  Tracks





// MARK: - PROFILE

public func getCurrentUserProfile(completion: @escaping(Result<UserProfile, Error>) -> Void) {
    createRequest(withUrl: URL(string: Constants.baseAPIUrl + "/me"),
                  withType: .GET
    ){ (baseRequest) in
        let task = URLSession.shared.dataTask(with: baseRequest) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(APIError.failedToGetData))
                return
            }
            do {
                //                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                let result = try JSONDecoder().decode(UserProfile.self, from: data)
                //                    print(result)
                completion(.success(result))
            } catch {
                print("UserProfile: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
        task.resume()
    }
}


// MARK:- CurrentUser Following

public func getCurrentUserFollowing(completion: @escaping(Result<UserFollowingArtistsResponse, Error>) -> Void) {
    createRequest(withUrl: URL(string: Constants.baseAPIUrl + "/me/following?type=artist&limit=20"),
                  withType: .GET
    ){ (baseRequest) in
        let task = URLSession.shared.dataTask(with: baseRequest) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
//                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    let result = try JSONDecoder().decode(UserFollowingArtistsResponse.self, from: data)
//                    print(result)
                    completion(.success(result))
                } catch {
                    print("UserFollowingResponse: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    // MARK: - BROWSE NewRealeases
    
    public func getNewReleases(completion: @escaping(Result<NewReleasesReponse, Error>) -> Void) {
        createRequest(withUrl: URL(string: Constants.baseAPIUrl + "/browse/new-releases?limit=50&country=PH"), withType: .GET) { (request) in
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
//                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    let result = try JSONDecoder().decode(NewReleasesReponse.self, from: data)
//                    print(result)
                    completion(.success(result))
                } catch {
                    print("NewReleasesReponse: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    // MARK:- Category Featured Playlist
    
    public func getFeaturedPlaylists(completion: @escaping(Result<FeaturedPlaylistsReponse, Error>) -> Void ) {
        createRequest(withUrl: URL(string: Constants.baseAPIUrl + "/browse/featured-playlists?limit=50&country=PH"), withType: .GET) { (request) in
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
//                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    let result = try JSONDecoder().decode(FeaturedPlaylistsReponse.self, from: data)
//                    print(result)
                    completion(.success(result))
                } catch {
                    print("FeaturedPlaylistsReponse: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    // MARK:- Recommendations
    
    public func getRecommendations(genres: Set<String>, completion: @escaping(Result<RecommendationsResponse, Error>) -> Void ) {
        let seeds = genres.joined(separator: ",")
        
        // &seed_tracks=3TVXtAsR1Inumwj472S9r4&
        
        createRequest(withUrl: URL(string: Constants.baseAPIUrl + "/recommendations?seed_genres=\(seeds)&limit=10&country=PH"), withType: .GET) { (request) in
            
//            print(request.url?.absoluteString as Any)
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
//                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    let result = try JSONDecoder().decode(RecommendationsResponse.self, from: data)
//                    print(result)
                    completion(.success(result))
                } catch {
                    print("getRecommendations: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    
    // MARK:- Recommendation Genre
    
    public func getRecommendationGenres(completion: @escaping(Result<RecommendationGenresResponse, Error>) -> Void) {
        createRequest(withUrl: URL(string: Constants.baseAPIUrl + "/recommendations/available-genre-seeds"), withType: .GET) { (request) in
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
//                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    let result = try JSONDecoder().decode(RecommendationGenresResponse.self, from: data)
//                    print(result)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    
    
    // MARK:- Categories
    
    
    public func getCategories(completion: @escaping(Result<[Category], Error>) -> Void) {
        createRequest(withUrl: URL(string: Constants.baseAPIUrl + "/browse/categories?limit=50&country=PH"), withType: .GET) { (request) in
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
//                    let result = try JSONSerializatio n.jsonObject(with: data, options: .allowFragments)
                    let result = try JSONDecoder().decode(AllCategoriesResponse.self, from: data)
                    print(result.categories.items)
                    completion(.success(result.categories.items))
                } catch {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    public func getCategoryPlaylists(withCategory category: Category, completion: @escaping(Result<[Playlist], Error>) -> Void) {
        createRequest(withUrl: URL(string: Constants.baseAPIUrl + "/browse/categories/\(category.id)/playlists?country=PH&limit=50"), withType: .GET) { (request) in
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
//                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    let result = try JSONDecoder().decode(CategorysPlaylistsResponse.self, from: data)
                    let playlists = result.playlists.items
                    print(playlists)
                    completion(.success(playlists))
                } catch {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    
    
    // MARK: - Search
    
    public func search(withQuery query: String, completion: @escaping(Result<[SearchResult], Error>) -> Void) {
        createRequest(
            withUrl: URL(
                string: Constants.baseAPIUrl + "/search?limit=10&type=album,artist,playlist,track&q=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"), withType: .GET) { (request) in
            
            print(request.url?.absoluteString ?? "none")
            
            let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
//                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    let result = try JSONDecoder().decode(SearchResultResponse.self, from: data)
                    var searchResults: [SearchResult] = []
                    
                    searchResults.append(contentsOf: result.tracks.items.compactMap({ SearchResult.track(model: $0) }))
                    searchResults.append(contentsOf: result.albums.items.compactMap({ SearchResult.album(model: $0 )}))
                    searchResults.append(contentsOf: result.artists.items.compactMap({ SearchResult.artist(model: $0 )}))
                    searchResults.append(contentsOf: result.playlists.items.compactMap({ SearchResult.playlist(model: $0) }))
                    
                    print("searchResults: \(searchResults)")
                    completion(.success(searchResults))
                } catch {
                    print(error)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    
    
    
    // MARK: - Private
    
    enum HTTPMethod: String {
        case GET
        case POST
    }
    
    private func createRequest(withUrl url: URL?,
                               withType type: HTTPMethod,
                               completion: @escaping(URLRequest) -> Void) {
        AuthManager.shared.withValidToken { (token) in
            guard let apiURL = url else {
                return
            }
            var request = URLRequest(url: apiURL)
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            request.httpMethod = type.rawValue
            request.timeoutInterval = 30
            completion(request)
            
        }
    }
    
    
    
}
