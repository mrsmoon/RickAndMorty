//
//  RMCharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Seher Aytekin on 10/4/23.
//

import UIKit

/// Controller to show info about single character
class RMCharacterDetailViewController: UIViewController {
    //MARK: - Init
    private let viewModel: RMCharacterDetailViewModel
    
    init(viewModel: RMCharacterDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = viewModel.title
    }

}
