//
//  Webservice.swift
//  HotCoffee
//
//  Created by Smiles on 20/05/19.
//  Copyright © 2019 Mariana. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}

struct Resource <T: Codable> {
    let url : URL
}


class Webservice {
    
    func load<T> (resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            
            guard let data  = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            
            let result  = try? JSONDecoder().decode(T.self, from: data)
            if let result = result {
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } else {
                completion(.failure(.decodingError))
            }
            
        }.resume()
        
        
    }
    
}
