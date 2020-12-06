//
//  ViewController.swift
//  GithubFetcher
//
//  Created by Nguyen Dinh Hoang on 12/5/20.
//

import UIKit

class ViewController: UIViewController {

    private var repoViewModel: RepoViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.repoViewModel = RepoViewModel()
    }


}

