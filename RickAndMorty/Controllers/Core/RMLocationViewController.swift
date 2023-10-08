//
//  RMLocationViewController.swift
//  RickAndMorty
//
//  Created by Seher Aytekin on 10/2/23.
//

import UIKit

final class RMLocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Locations"
        addSearchButton()
    }
    
    private func addSearchButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSelect))
    }
    
    @objc
    func didTapSelect() {
        
    }

}
