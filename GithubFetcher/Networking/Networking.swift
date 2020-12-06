//
//  Networking.swift
//  GithubFetcher
//
//  Created by Nguyen Dinh Hoang on 12/6/20.
//

import Foundation

protocol Networking {
    associatedtype T
    
    func fetch(with request: URLRequest, then handler: @escaping (Result<T, Error>) -> Void)
    
    func fetchList(with request: URLRequest, then handler: @escaping (Result<[T], Error>) -> Void)
}
