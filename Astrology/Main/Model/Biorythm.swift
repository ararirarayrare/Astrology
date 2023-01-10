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
            return UIColor(red: 87/255, green: 45/255, blue: 1, alpha: 1.0)
        case .emotional:
            return UIColor(red: 170/255, green: 85/255, blue: 1, alpha: 1.0)
        case .intellectual:
            return UIColor(red: 149/255, green: 147/255, blue: 1, alpha: 1.0)
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

