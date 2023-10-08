//
//  RMEpisodeListViewViewModel.swift
//  RickAndMorty
//
//  Created by Seher Aytekin on 10/7/23.
//

import UIKit

protocol RMEpisodeListViewModelDelegate: AnyObject {
    func didLoadInitialEpisodes()
    func didLoadMoreEpisodes(with newIndexPaths: [IndexPath])
    func didSelectEpisode(_ episode: RMEpisode)
}

/// View model to handle episode list view logic
final class RMEpisodeListViewViewModel: NSObject {
    public weak var delegate: RMEpisodeListViewModelDelegate?
    
    private let borderColors: [UIColor] = [
        .systemRed,
        .systemBlue,
        .systemCyan,
        .systemMint,
        .systemOrange,
        .systemIndigo,
        .systemPurple,
        .systemYellow
    ]
    
    private var episodes: [RMEpisode] = [] {
        didSet {
            cellViewModels = []
            for episode in episodes {
                let viewModel = RMCharacterEpisodeCollectionViewCellViewModel(
                    episodeDataUrl: URL(string: episode.url),
                    borderColor: borderColors.randomElement() ?? .systemBlue
                )
                cellViewModels.append(viewModel)
            }
        }
    }
    
    private var cellViewModels: [RMCharacterEpisodeCollectionViewCellViewModel] = []
    private var apiInfo: RMGetAllEpisodesReponse.Info? = nil
    
    func fetchEpisodes() {
        RMService.shared.execute(.listEpisodesRequests, expecting: RMGetAllEpisodesReponse.self) { [weak self] result in
            switch result {
            case .success(let response):
                let results = response.results
                let info = response.info
                self?.episodes = results
                self?.apiInfo = info
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialEpisodes()
                }
            case.failure(let error):
                print(error)
            }
        }
    }
    
    /// Paginate if additional episodes are needed
    public func fetchAdditionalEpisodes(url: URL) {
        guard !isLoadingMoreEpisodes else { return }
        
        guard let request = RMRequest(url: url) else {
            return
        }
        
        isLoadingMoreEpisodes = true
        print("fetching")
        RMService.shared.execute(request, expecting: RMGetAllEpisodesReponse.self) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let response):
                let moreResults = response.results
                let info = response.info
                self.apiInfo = info
                
                let originalCount = self.episodes.count
                let newCount = moreResults.count
                let startingIndex = originalCount
                
                let indexPathsToAdd: [IndexPath] = Array(startingIndex..<startingIndex + newCount).compactMap({
                    return IndexPath(row: $0, section: 0)
                })
                
                self.episodes.append(contentsOf: moreResults)
                print(cellViewModels.count)
                DispatchQueue.main.async {
                    self.delegate?.didLoadMoreEpisodes(with: indexPathsToAdd)
                    self.isLoadingMoreEpisodes = false
                }
            case.failure(let error):
                self.isLoadingMoreEpisodes = false
                print(error)
            }
        }
    }
    
    public var shouldShowLoadMoreIndicator: Bool {
        return apiInfo?.next != nil
    }
    
    private var isLoadingMoreEpisodes = false
    
}

//MARK: - ScrollView

extension RMEpisodeListViewViewModel: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard shouldShowLoadMoreIndicator,
              !isLoadingMoreEpisodes,
              !cellViewModels.isEmpty,
              let nextUrlString = apiInfo?.next,
              let url = URL(string: nextUrlString) else {
            return
        }
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { [weak self] timer in
            let offset = scrollView.contentOffset.y
            let totalContentHeight = scrollView.contentSize.height
            let totalScrollViewFixedHeight = scrollView.frame.size.height
            
            if offset >= (totalContentHeight - totalScrollViewFixedHeight) {
                self?.fetchAdditionalEpisodes(url: url)
            }
            
            timer.invalidate()
        }
    }
}

//MARK: - CollectionView

extension RMEpisodeListViewViewModel: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterEpisodeCollectionViewCell.cellIdentifier, for: indexPath) as? RMCharacterEpisodeCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        
        cell.configure(with: cellViewModels[indexPath.row])
        
        return cell
    }
}

extension RMEpisodeListViewViewModel: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let episode = episodes[indexPath.row]
        delegate?.didSelectEpisode(episode)
    }
}

extension RMEpisodeListViewViewModel: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = bounds.width - 20
        return CGSize(width: width, height: 100)
    }
    
    // MARK: - Footer
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionFooter,
                let footer = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: RMFooterLoadingCollectionReusableView.identifier,
            for: indexPath) as? RMFooterLoadingCollectionReusableView else {
            fatalError("unsupported")
        }
        footer.startAnimating()
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        guard shouldShowLoadMoreIndicator else {
            return .zero
        }
        
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
}
