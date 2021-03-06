//
//  Repository.swift
//  GithubFetcher
//
//  Created by Nguyen Dinh Hoang on 12/6/20.
//

import Foundation

//Repo
struct Wrapper: Codable {
    let items: [Repository]?
}

struct Repository: Codable {
    let name: String?
    let owner: Owner?
}

struct Owner: Codable {
    let name: String?
}

extension Owner {
    enum CodingKeys: String, CodingKey {
        case name = "login"
    }
}

//Branches
struct Branch: Codable {
    let name: String?
    let protected: Bool?
}

