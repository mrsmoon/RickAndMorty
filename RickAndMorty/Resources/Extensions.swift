//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Seher Aytekin on 10/4/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
