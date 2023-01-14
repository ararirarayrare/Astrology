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

    func value(forDate date: Date?) -> Float {
        var P: Float {
            switch self {
            case .physical:
                return 23
            case .emotional:
                return 28
            case .intellectual:
                return 33
            }
        }
        
        let t = Float(Date.daysFromBirthday(toDate: date))
                
        return sin(2 * .pi * t / P)
    }
}

