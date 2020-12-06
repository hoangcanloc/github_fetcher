//
//  Networking.swift
//  GithubFetcher
//
//  Created by Nguyen Dinh Hoang on 12/6/20.
//

import Foundation

protocol Networking {
   
    func execute<T: Decodable>(_ endpoint: Endpoint, completion: @escaping((Result<T, Error>) -> Void))
    
}

extension Networking {
    func execute<T: Decodable>(_ endpoint: Endpoint, completion: @escaping((Result<T, Error>) -> Void)) {
        let urlRequest = URLRequest(url:endpoint.url)
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            do {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    preconditionFailure("No error was received but also don't have data")
                }
                
                let decodedObject = try JSONDecoder().decode(T.self, from: data)
                
                completion(.success(decodedObject))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

