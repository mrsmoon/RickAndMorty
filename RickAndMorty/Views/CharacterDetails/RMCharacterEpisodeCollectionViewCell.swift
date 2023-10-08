//
//  RMCharacterEpisodeCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Seher Aytekin on 10/6/23.
//

import UIKit

final class RMCharacterEpisodeCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterEpisodeCollectionViewCell"
    
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private var airDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.numberOfLines = 0
        return label
    }()
    
    private var seasonLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .tertiarySystemBackground
        contentView.layer.cornerRadius = 8
        contentView.layer.borderWidth = 2
        contentView.addSubviews(seasonLabel, nameLabel, airDateLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        seasonLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
        seasonLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
        seasonLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        seasonLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
        
        nameLabel.topAnchor.constraint(equalTo: seasonLabel.bottomAnchor),
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        nameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3),
        
        airDateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
        airDateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
        airDateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        airDateLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        seasonLabel.text = nil
        nameLabel.text = nil
        airDateLabel.text = nil
    }
    
    public func configure(with viewModel: RMCharacterEpisodeCollectionViewCellViewModel) {
        viewModel.registerForData { data in
            self.seasonLabel.text = "Episode: " + data.episode
            self.nameLabel.text = data.name
            self.airDateLabel.text = "Aired on: " + data.air_date
        }
        viewModel.fetchEpisode()
        
        contentView.layer.borderColor = viewModel.borderColor.cgColor
    }
}
