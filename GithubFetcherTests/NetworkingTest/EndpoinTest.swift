//
//  EndpoinTest.swift
//  GithubFetcherTests
//
//  Created by Nguyen Dinh Hoang on 12/5/20.
//

import XCTest
@testable import GithubFetcher

class EndpoinTest: XCTestCase {

    override class func setUp() {
        
    }
    
    func testRepoListEndpoint() {
        let repoListEndpoint = Endpoint.repos
        XCTAssertTrue(repoListEndpoint.url.absoluteString == "https://api.github.com/repositories", "Repo list endpoint is incorrect")
    }
    
    func testRepoByNameEndpoint() {
        let repoByNameEndpoint = Endpoint.searchRepo(byName: "css")
        XCTAssertTrue(repoByNameEndpoint.url.absoluteString == "https://api.github.com/search/repositories?q=css", "Repo by name endpoint is incorrect")
    }

    func testBranchesEndpoint() {
        let branchesEndpoint = Endpoint.searchBranches(ofOwner: "octocat", inRepo: "hello-world")
        XCTAssertTrue(branchesEndpoint.url
                        .absoluteString == "https://api.github.com/repos/octocat/hello-world/branches", "Branches enpoint are in correct")
    }
}
