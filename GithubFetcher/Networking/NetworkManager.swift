//
//  NetworkManager.swift
//  GithubFetcher
//
//  Created by Nguyen Dinh Hoang on 12/6/20.
//

import Foundation

final class NetworkManager: Networking {
    
    enum NetworkConfiguration {
        case defaultRequestConfig
        case authenticatedRequestConfig
    }
    
    private enum Constant: String {
        case token = "223b98d596fceb5d1467b58bd5f687c6bac322f9"
    }
    
    private let config: NetworkConfiguration
    
    func prepareRequest(for endpoint: Endpoint) -> URLRequest {
        switch config {
        case .defaultRequestConfig:
            return URLRequest(url: endpoint.url)
        case .authenticatedRequestConfig:
            var secureRequest = URLRequest(url: endpoint.url)
            secureRequest.addValue("Token \(Constant.token.rawValue)", forHTTPHeaderField: "Authorization")
            return secureRequest
        }
        
    }
    
    init(config: NetworkConfiguration) {
        self.config = config
    }
    
    init() {
        fatalError("init(config:) has not been implemented")
    }
    
}
