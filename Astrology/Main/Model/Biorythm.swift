//
//  Biorythm.swift
//  Astrology
//
//  Created by mac on 28.12.2022.
//

import UIKit

enum Biorythm {
    
    case physical(value: Double), emotional(value: Double), intellectual(value: Double)
    
    var barColor: UIColor {
        switch self {
        case .physical:
            return .blue.withAlphaComponent(0.5)
        case .emotional:
            return .orange
        case .intellectual:
            return .yellow
        }
    }
    
    var value: Double {
        switch self {
        case .physical(let value):
            return value
        case .emotional(let value):
            return value
        case .intellectual(let value):
            return value
        }
    }
    
    var title: String {
        switch self {
        case .physical:
            return "Physical"
        case .emotional:
            return "Emotional"
        case .intellectual:
            return "Intellectual"
        }
    }
}
