//
//  RepositoryService.swift
//  GithubFetcher
//
//  Created by Nguyen Dinh Hoang on 12/6/20.
//

import Foundation

protocol RepoProviding {
    var network: Networking { get }
    
    func getRepositories(_ completion: @escaping (Result<[Repository], Error>) -> Void)
    
    func findRepositoriesByName(_ name: String, _ completion: @escaping (Result<Wrapper, Error>) -> Void)
}

extension RepoProviding {
    func getRepositories(_ completion: @escaping (Result<[Repository], Error>) -> Void) {
        network.execute(Endpoint.repos, completion: completion)
    }
    
    func findRepositoriesByName(_ name: String, _ completion: @escaping (Result<Wrapper, Error>) -> Void) {
        network.execute(Endpoint.searchRepo(byName: name), completion: completion)
    }
}

struct RepositoryService: RepoProviding {
    var network: Networking
    
    init(network: Networking) {
        self.network = network
    }
    
}



