//
//  GFError.swift
//  GHFollowers
//
//  Created by Ahmet Yusuf Yuksek on 10/7/21.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server is invalid. Please try again."
    case unableToFavorite = "There was an error favoriting this user. Please try again!"
    case alreadyInFavorite = "You already favorited this user."
}
