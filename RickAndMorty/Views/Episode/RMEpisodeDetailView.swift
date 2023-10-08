//
//  RMEpisodeDetailView.swift
//  RickAndMorty
//
//  Created by Seher Aytekin on 10/7/23.
//

import UIKit

final class RMEpisodeDetailView: UIView {
    
    private let viewModel: RMEpisodeDetailViewViewModel
    
    init(frame: CGRect, viewModel: RMEpisodeDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemRed
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
