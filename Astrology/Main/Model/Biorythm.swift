//
//  Biorythm.swift
//  Astrology
//
//  Created by mac on 28.12.2022.
//

import UIKit

enum Biorythm: CaseIterable {

    case physical, emotional, intellectual

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

    var yesterdayValue: Float {
        switch self {
        case .physical:
            return -0.3
        case .emotional:
            return 0.9
        case .intellectual:
            return 0.7
        }
    }

    var todayValue: Float {
        switch self {
        case .physical:
            return 0.5
        case .emotional:
            return 0.4
        case .intellectual:
            return 0.5
        }
    }

    var tomorrowValue: Float {
        switch self {
        case .physical:
            return 0.1
        case .emotional:
            return -0.7
        case .intellectual:
            return 0.9
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

