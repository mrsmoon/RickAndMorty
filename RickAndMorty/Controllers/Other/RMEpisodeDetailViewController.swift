//
//  RMEpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by Seher Aytekin on 10/7/23.
//

import UIKit

final class RMEpisodeDetailViewController: UIViewController {
    
    private let episode: RMEpisode?
    
    init(episode: RMEpisode?) {
        self.episode = episode
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
    }

}
