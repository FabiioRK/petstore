//
//  Pet.swift
//  petstore
//
//  Created by Fábio Romão on 17/06/23.
//

import Foundation

struct Token: Decodable {
    let tokenType: String?
    let expiresIn: Int?
    let accessToken: String?

    enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case accessToken = "access_token"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        tokenType = try values.decodeIfPresent(String.self, forKey: .tokenType)
        expiresIn = try values.decodeIfPresent(Int.self, forKey: .expiresIn)
        accessToken = try values.decodeIfPresent(String.self, forKey: .accessToken)
    }
}

struct client {
    static let clientID = "1JofFnp3iWb9UVvQZf6WWQiUG7Vpqyf3axrhzh4H2quEtf2oZK"
    static let clientSecret = "aehSGiyTNCSnQ5Gv7Qq8ww9HSwRLHHuMq2J1Jx24"
    
    static let bodyString = "grant_type=client_credentials&client_id=" + clientID + "&client_secret=" + clientSecret
    
    static let urlString: (token: String, request: String) = (
        "https://api.petfinder.com/v2/oauth2/token",
        "https://api.petfinder.com/v2/animals?sort=recent"
    )
    
    static let bearer = "Bearer "
}

struct Error {
    static let invalidURL = "Invalid URL"
    static let invalidBody = "Invalid body"
    static let noData = "No data"
    static let noToken = "No token."
}

enum HttpMethod: String {
    case post = "POST"
    case get = "GET"
}

enum HttpHeaderField: String {
    case auth = "Authorization"
}
