//
//  OAuthTokenStorage.swift
//  ImageFeed
//
//  Created by Семен Титов on 16.01.2024.
//

import Foundation

final class OAuth2TokenStorage {
    
    var token: String? {
        get {
            return UserDefaults.standard.string(forKey: "bearerToken")
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: "bearerToken")
        }
    }
}
