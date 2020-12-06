//
//  RepositoryService.swift
//  GithubFetcher
//
//  Created by Nguyen Dinh Hoang on 12/6/20.
//

import Foundation

struct RepositoryService: Networking {
    
    typealias T = Repository
    
    func fetchList(with request: URLRequest, then handler: @escaping (Result<[Repository], Error>) -> Void)  {
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, _, error) in
            if let data = data, let repos = try? JSONDecoder().decode([Repository].self, from: data) {
                handler(.success(repos))
            }
            
            if let error = error {
                handler(.failure(error))
            }
        }
        task.resume()
    }
    
    func fetch(with request: URLRequest, then handler: @escaping (Result<Repository, Error>) -> Void) {
        
    }
    
}



