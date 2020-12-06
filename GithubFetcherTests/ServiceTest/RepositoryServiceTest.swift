//
//  RepositoryServiceTest.swift
//  GithubFetcherTests
//
//  Created by Nguyen Dinh Hoang on 12/6/20.
//

import XCTest
@testable import GithubFetcher

struct NetworkManager: Networking {
   
}

class RepositoryServiceTest: XCTestCase {

    override class func setUp() {
        
    }

    func testFetchRepositories() {
        let expectation = XCTestExpectation(description: "Fetch list repository from github successfully")
        let reposService = RepositoryService(network: NetworkManager())
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

    func testFetchRepositoriesByName() {
        let expectation = XCTestExpectation(description: "Fetch list repository by name from github successfully")
        let reposService = RepositoryService(network: NetworkManager())
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

}
