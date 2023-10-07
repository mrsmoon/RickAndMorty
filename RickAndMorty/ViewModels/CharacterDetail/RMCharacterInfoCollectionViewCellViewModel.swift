//
//  RMCharacterInfoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Seher Aytekin on 10/6/23.
//

import UIKit

final class RMCharacterInfoCollectionViewCellViewModel {
    private let value: String
    private let type: InfoType
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSZ"
        formatter.timeZone = .current
        return formatter
    }()
    
    static let shortDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.timeZone = .current
        return formatter
    }()
    
    public var title: String {
        type.displayTitle
    }
    
    public var iconImage: UIImage? {
        return type.iconImage
    }
    
    public var tintColor: UIColor? {
        return type.tintColor
    }
    
    public var displayValue: String {
        if value.isEmpty {
            return "None"
        }
        
        if type == .created, let date = Self.dateFormatter.date(from: value) {
            return Self.shortDateFormatter.string(from: date)
        }
        
        return value
    }
    
    enum InfoType: String {
        case status
        case gender
        case type
        case species
        case origin
        case location
        case created
        case episodeCount
        
        var tintColor: UIColor {
            switch self {
            case .status:
                return .systemBlue
            case .gender:
                return .systemRed
            case .type:
                return .systemOrange
            case .species:
                return .systemMint
            case .origin:
                return .systemPurple
            case .location:
                return .systemYellow
            case .created:
                return .systemGreen
            case .episodeCount:
                return .systemCyan
            }
        }
        
        var displayTitle: String {
            switch self{
            case .status,
                    .gender,
                    .type,
                    .species,
                    .origin,
                    .location,
                    .created:
                return rawValue.uppercased()
            case .episodeCount:
                return "EPISODE COUNT"
            }
        }
        
        var iconImage: UIImage? {
            switch self {
            case .status:
                return UIImage(systemName: "bell")
            case .gender:
                return UIImage(systemName: "bell")
            case .type:
                return UIImage(systemName: "bell")
            case .species:
                return UIImage(systemName: "bell")
            case .origin:
                return UIImage(systemName: "bell")
            case .location:
                return UIImage(systemName: "bell")
            case .created:
                return UIImage(systemName: "bell")
            case .episodeCount:
                return UIImage(systemName: "bell")
            }
        }
    }
    
    
    //MARK: - Init
    
    init(value: String, type: InfoType) {
        self.value =  value
        self.type = type
    }
}
