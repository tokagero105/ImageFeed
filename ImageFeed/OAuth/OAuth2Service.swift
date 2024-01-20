//
//  OAuthTokenResponseBody.swift
//  ImageFeed
//
//  Created by Семен Титов on 16.01.2024.
//

import Foundation
import UIKit

final class OAuth2Service {
    static let shared = OAuth2Service()
    private let urlSession = URLSession.shared

    private (set) var authToken: String? {
        get {
            return OAuth2TokenStorage().token
        }
        set {
            OAuth2TokenStorage().token = newValue
        }
    }
    
    func fetchOAuthToken(_ code: String, completion: @escaping (Result<String, Error>) -> Void) {
        let request = authTokenRequest(code: code)!
        let task = object(for: request) { result in
            switch result {
            case .success(let body):
                let authToken = body.accessToken
                self.authToken = authToken
                completion(.success(authToken))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        task.resume()
    }
}


extension URLRequest {
    static func makeHttpRequest(
        path: String,
        httpMethod: String,
        baseUrl: URL? = DefaultBaseUrl) ->URLRequest? {
            guard
                let baseUrl = baseUrl,
                let url = URL(string: path, relativeTo: baseUrl) else { return nil }
            var request = URLRequest(url: url)
            request.httpMethod = httpMethod
            return request
        }
}

extension OAuth2Service {
    private func object(
        for reguest: URLRequest,
        comletion: @escaping (Result<OAuthTokenResponseBody, Error>) -> Void
    ) -> URLSessionTask {
        let decoder = JSONDecoder()
        return urlSession.data(for: reguest) { (result: Result<Data, Error>) in
            let response = result.flatMap { data -> Result<OAuthTokenResponseBody, Error> in
                Result { try decoder.decode(OAuthTokenResponseBody.self, from: data)}
            }
            comletion(response)
        }
    }
    
    private func authTokenRequest(code: String) -> URLRequest? {
        URLRequest.makeHttpRequest(
            path: "/oauth/token"
            + "?client_id=\(AccessKey)"
            + "&&client_secret=\(SecretKey)"
            + "&&redirect_uri=\(RedirectURI)"
            + "&&code=\(code)"
            + "&&grant_type=authorization_code",
            httpMethod: "POST",
            baseUrl: URL(string: "https://unsplash.com")!
        )
    }
}
    
    private struct OAuthTokenResponseBody: Decodable {
        let accessToken: String
        let tokenType: String
        let scope: String
        let createdAt: Int
        
        enum CodingKeys: String, CodingKey {
            case accessToken = "access_token"
            case tokenType = "token_type"
            case scope
            case createdAt = "created_at"
        }
    }

extension URLSession {
    enum NetworkError: Error {
        case httpStatusCode(Int)
        case urlRequestError(Error)
        case urlSessionError
    }
    
    func data(
        for request: URLRequest,
        comletion: @escaping (Result<Data, Error>) -> Void
    ) -> URLSessionTask {
        let fulfillCompletion: (Result<Data, Error>) -> Void = {result in
            DispatchQueue.main.async {
                comletion(result)
            }
        }
        
        let task = dataTask(with: request, completionHandler: {data, response, error in
            if let data = data,
               let response = response,
               let statusCode = (response as? HTTPURLResponse)?.statusCode
            {
                if 200 ..< 300 ~= statusCode {
                        fulfillCompletion(.success(data))
                } else {
                        fulfillCompletion(.failure(NetworkError.httpStatusCode(statusCode)))
                }
            } else if let error = error {
                    fulfillCompletion(.failure(NetworkError.urlRequestError(error)))
            } else {
                    fulfillCompletion(.failure(NetworkError.urlSessionError))
            }
        })
        task.resume()
        return task
    }
}
