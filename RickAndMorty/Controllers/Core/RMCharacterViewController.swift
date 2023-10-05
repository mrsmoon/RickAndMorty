//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Seher Aytekin on 10/2/23.
//

import UIKit

final class RMCharacterViewController: UIViewController {
    private let characterListView = RMCharacterListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Characters"
        setupViews()
    }
    
    private func setupViews() {
        characterListView.delegate = self
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

//MARK: - RMCharacterListViewDelegate

extension RMCharacterViewController : RMCharacterListViewDelegate {
    func rmCharacterListView(_ charaterListView: RMCharacterListView, didSelectCharacter character: RMCharacter) {
        // Open detail controller for that character
        let detailVC = RMCharacterDetailViewController(viewModel: RMCharacterDetailViewModel(character: character))
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
