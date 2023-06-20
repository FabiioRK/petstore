//
//  Pet.swift
//  petstore
//
//  Created by Fábio Romão on 19/06/23.
//

import Foundation

struct Pet: Decodable {
    let animal : [Pets]?

    enum CodingKeys: String, CodingKey {
        case animals = "animals"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        animal = try values.decodeIfPresent([Pets].self, forKey: .animals)
    }
}

struct Pets: Decodable {
    let name: String?
    let description: String?
    let age: String?
    let gender: String?
    let photoURL: String?
    
    struct Photos: Decodable {
        let small: String?
        
        enum CodingKeys: String, CodingKey {
            case small = "small"
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            self.small = try values.decodeIfPresent(String.self, forKey: .small)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "description"
        case age = "age"
        case gender = "gender"
        case photos = "photos"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        age = try values.decodeIfPresent(String.self, forKey: .age)
        gender = try values.decodeIfPresent(String.self, forKey: .gender)
        let photos = try values.decodeIfPresent([Photos].self, forKey: .photos)
        photoURL = photos?.first?.small
    }
}

