//
//  Endpoint.swift
//  GithubFetcher
//
//  Created by Nguyen Dinh Hoang on 12/5/20.
//

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem]?
}

extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        components.path = "/\(path)"
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components")
        }
        
        return url
    }
}

//Utility
extension Endpoint {
    static var repos: Self {
        Endpoint(path: "repositories")
    }
    
    static func searchRepo(byName name: String) -> Self {
        let querry = URLQueryItem(name: "q", value: name)
        return Endpoint(path: "repositories", queryItems: [querry])
    }
    
    static func searchBranches(ofOwner name: String, inRepo repo: String) -> Self {
        return Endpoint(path: "repos/\(name)/\(repo)/branches")
    }
}
