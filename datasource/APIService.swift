//
//  APIService.swift
//  petstore
//
//  Created by Fábio Romão on 18/06/23.
//

import Foundation

protocol AnimalList {
    func displayAnimalList()
    func displayTestData()
}

class PetList {
    
    var delegate: AnimalList?
    var animals: [Pets]? = nil
    var dispatchGroup = DispatchGroup()
    
    func fetchAnimals() {
        getAnimals()

        dispatchGroup.notify(queue: .main) {
            self.delegate?.displayAnimalList()
        }
    }
    
    private func getAnimals() {
        dispatchGroup.enter()
        guard let url  = URL(string: client.urlString.token)  else {
            print(Error.invalidURL);
            return
        }
        guard let body = client.bodyString.data(using: .utf8) else {
            print(Error.invalidBody);
            return
        }
        
        var urlRequest = URLRequest(url : url)
        urlRequest.httpMethod = HttpMethod.post.rawValue
        urlRequest.httpBody = body
        
        var token: String? = nil

        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            do {
                guard error == nil else {
                    print(error!.localizedDescription);
                    return
                }
                guard let data = data else {
                    print(Error.noData);
                    return
                }
                let jsonDecoder = JSONDecoder()
                let json = try jsonDecoder.decode(Token.self, from: data)
                token = json.accessToken
                if token == nil {
                    print(Error.noToken)
                }
            } catch {
                print(error.localizedDescription)
            }

            guard let url = URL(string: client.urlString.request) else { print(Error.invalidURL); return }
        
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = HttpMethod.get.rawValue
            let value = client.bearer + (token ?? Error.noToken)
            urlRequest.addValue(value, forHTTPHeaderField: HttpHeaderField.auth.rawValue)
            
            URLSession.shared.dataTask(with: urlRequest) { [weak self] (data, response, error) in
                do {
                    guard error == nil else {
                        print(error?.localizedDescription as Any);
                        return
                    }
                    guard let data = data else {
                        print(Error.noData);
                        return
                    }
                    let jsonDecoder = JSONDecoder()
                    let json = try jsonDecoder.decode(Pet.self, from: data)
                    self?.animals = json.animal
                    self?.dispatchGroup.leave()
                    print(json)
                } catch {
                    print(error.localizedDescription)
                }
            }.resume()
        }.resume()
    }
    
} 

