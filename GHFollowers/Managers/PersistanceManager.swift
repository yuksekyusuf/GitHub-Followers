//
//  PersistanceManager.swift
//  GHFollowers
//
//  Created by Ahmet Yusuf Yuksek on 10/19/21.
//

import Foundation

enum PersistanceActionType {
    case add, remove
}

enum PersistanceManager {
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    
    static private let defaults = UserDefaults.standard
    
    static func updateWith(favorite: Follower, actiontype: PersistanceActionType, completed: @escaping (GFError?) -> Void) {
        
        retriveFavorities { result in
            switch result {
            case .success(let favorites):
                var retrivedFavorites = favorites
                
                switch actiontype {
                case .add:
                    guard !retrivedFavorites.contains(favorite) else {
                        completed(.alreadyInFavorite)
                        return
                    }
                    retrivedFavorites.append(favorite)
                 
                case .remove:
                    retrivedFavorites.removeAll { $0.login == favorite.login }
                }
                
                completed(save(favorites: retrivedFavorites))
            case .failure(let error):
                completed(error)
            }
        }
        
    }
    
    static func retriveFavorities(completed: @escaping(Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func save(favorites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
}
