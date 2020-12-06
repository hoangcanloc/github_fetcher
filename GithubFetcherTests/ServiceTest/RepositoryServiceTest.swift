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

    func testFetchRepoList() {
        let expectation = XCTestExpectation(description: "Fetch list repository from github successfully")
        let reposService = RepositoryService()
        reposService.fetchList(with: URLRequest(url: Endpoint.repos.url)) { (result) in
            switch result {
            case .success(let repos):
                XCTAssertNotNil(repos, "Not data was downloaded")
            case .failure(_):
                return
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

    

}
