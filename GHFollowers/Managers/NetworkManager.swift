//
//  NetworkManager.swift
//  GHFollowers
//
//  Created by Ahmet Yusuf Yuksek on 10/7/21.
//


import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseURL = "http://api.github.com/users/"
    let cache = NSCache<NSString, UIImage>()
    
    
    private init() {}
    
    func getFollower(for username: String, page: Int, complition: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        guard let url = URL(string: endpoint) else {
            complition(.failure(.invalidUsername))
            return
            
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                complition(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                complition(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                complition(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                complition(.success(followers))
            } catch {
                complition(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    func getUserInfo(for username: String, completed: @escaping (Result<User, GFError>) ->Void ) {
        let endpoint = baseURL + "\(username)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let users = try decoder.decode(User.self, from: data)
                completed(.success(users))

            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
