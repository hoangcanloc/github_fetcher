//
//  RepositoryServiceTest.swift
//  GithubFetcherTests
//
//  Created by Nguyen Dinh Hoang on 12/6/20.
//

import XCTest
@testable import GithubFetcher

class RepositoryServiceTest: XCTestCase {

    override class func setUp() {
        
    }

    //test fetch all public repos
    func testFetchRepositoriesWithDefaultConfig() {
        let expectation = XCTestExpectation(description: "Fetch list repository from github successfully")
        let reposService = RepositoryService(network: NetworkManager(config: .defaultRequestConfig))
        reposService.getRepositories { (result) in
            switch result {
            case .success(let repos):
                XCTAssertNotNil(repos, "No data was downloaded")
            case .failure(_):
                return
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testFetchRepositoriesWithSecureConfig() {
        let expectation = XCTestExpectation(description: "Fetch list repository from github successfully")
        let reposService = RepositoryService(network: NetworkManager(config: .authenticatedRequestConfig))
        reposService.getRepositories { (result) in
            switch result {
            case .success(let repos):
                XCTAssertNotNil(repos, "No data was downloaded")
            case .failure(_):
                return
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

    //test search repos
    func testFetchRepositoriesByNameWithDefaultConfig() {
        let expectation = XCTestExpectation(description: "Fetch list repository by name from github successfully")
        let reposService = RepositoryService(network: NetworkManager(config: .defaultRequestConfig))
        reposService.findRepositoriesByName("css") { (result) in
            switch result {
            case .success(let repos):
                XCTAssertNotNil(repos, "No data was downloaded")
            case .failure(_):
                return
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testFetchRepositoriesByNameWithSecureConfig() {
        let expectation = XCTestExpectation(description: "Fetch list repository by name from github successfully")
        let reposService = RepositoryService(network: NetworkManager(config: .authenticatedRequestConfig))
        reposService.findRepositoriesByName("css") { (result) in
            switch result {
            case .success(let repos):
                XCTAssertNotNil(repos, "No data was downloaded")
            case .failure(_):
                return
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    //test search branches in a specific repo, owned by a specific owner
    func testSearchBranchesWithDefaultConfig() {
        let expectation = XCTestExpectation(description: "Search branches successfully")
        let reposService = RepositoryService(network: NetworkManager(config: .defaultRequestConfig))
        reposService.findBranches(in: "hello-world", ownedBy: "octocat") { (result) in
            switch result {
            case .success(let repos):
                XCTAssertNotNil(repos, "No data was downloaded")
            case .failure(_):
                return
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
    

}
