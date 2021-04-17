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
    
    public func getFeaturedPlaylists(completion: @escaping(Result<FeaturedPlaylistsReponse, Error>) -> Void ) {
        createRequest(withUrl: URL(string: Constants.baseAPIUrl + "/browse/featured-playlists?limit=10"), withType: .GET) { (request) in
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
    
    public func getRecommendations(genres: Set<String>, completion: @escaping(Result<RecommendationsResponse, Error>) -> Void ) {
        let seeds = genres.joined(separator: ",")
        
        // &seed_tracks=3TVXtAsR1Inumwj472S9r4&seed_artists=3TVXtAsR1Inumwj472S9r4&
        
        createRequest(withUrl: URL(string: Constants.baseAPIUrl + "/recommendations?seed_genres=\(seeds)&limit=6"), withType: .GET) { (request) in
            
//            print(request.url?.absoluteString as Any)
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
//                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    let result = try JSONDecoder().decode(RecommendationsResponse.self, from: data)
                    print(result)
                    completion(.success(result))
                } catch {
                    print("getRecommendations: \(error.localizedDescription)")
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
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
