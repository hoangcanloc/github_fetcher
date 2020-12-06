//
//  RepoViewModel.swift
//  GithubFetcher
//
//  Created by Nguyen Dinh Hoang on 12/6/20.
//

import Foundation

final class RepoViewModel {
    
    public var repoStore = [(repoName: String?, repoOwner: String?)]()
    
    private var service: RepoProviding
    
    init(with service: RepoProviding = RepositoryService(network: NetworkManager(config: .defaultRequestConfig))) {
        self.service = service
    }
}

extension RepoViewModel {
    
    func fetchRepos() {
        self.service.getRepositories { [weak self] (result) in
            switch result {
            case .success(let repos):
                repos.forEach { repo in
                    self?.repoStore.append((repoName: repo.name, repoOwner:repo.owner?.name))
                }
            case .failure(let error):
                //handler error
                print("Ecounter this error \(error)")
            }
        }
    }
    
}
