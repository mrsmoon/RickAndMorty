//
//  RMEpisodeDetailViewController.swift
//  RickAndMorty
//
//  Created by Seher Aytekin on 10/7/23.
//

import UIKit

final class RMEpisodeDetailViewController: UIViewController {
    private let detailView: RMEpisodeDetailView
    private let viewModel: RMEpisodeDetailViewViewModel
    
    //MARK: - Init
    
    init(episode: RMEpisode?) {
        self.viewModel = .init(episode: episode)
        self.detailView = RMEpisodeDetailView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
        view.backgroundColor = .systemBackground
        view.addSubview(detailView)
        addShareButton()
        addConstraints()
    }
    
    private func addShareButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didTapShare))
    }
    
    @objc
    func didTapShare() {
        
    }
    
    //MARK: - Private
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            detailView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    

}
