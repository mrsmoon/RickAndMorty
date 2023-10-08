//
//  RMSearchViewController.swift
//  RickAndMorty
//
//  Created by Seher Aytekin on 10/7/23.
//

import UIKit

class RMSearchViewController: UIViewController {
    
    struct Config {
        enum SearchType {
            case character
            case episode
            case location
        }
        
        let type: SearchType
    }
    
    private let config: Config
    
    init(config: Config) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
    }
    
}
