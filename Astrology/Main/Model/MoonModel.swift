//
//  MoonPhase.swift
//  Astrology
//
//  Created by mac on 26.12.2022.
//

import UIKit

struct MoonModel {
    
    enum Phase {
        case newMoon,
             waxingCrescent,
             firstQuater,
             waxingGibbous,
             fullMoon,
             waningGibbous,
             lastQuater,
             waningCrescent
        
        var string: String {
            switch self {
            case .newMoon:
                return "New moon"
            case .waxingCrescent:
                return "Waxing crescent"
            case .firstQuater:
                return "First quater"
            case .waxingGibbous:
                return "Waxing gibbous"
            case .fullMoon:
                return "Full moon"
            case .waningGibbous:
                return "Waning gibbous"
            case .lastQuater:
                return "Last quater"
            case .waningCrescent:
                return "Waning crescent"
            }
        }
        
        static func forDate(_ date: Date) -> Phase {
            let components = Calendar.current.dateComponents([.day, .month, .year], from: date)
            
            let year = components.year ?? 2023
            let month = components.month ?? 1
            let day = components.day ?? 1
            
            let L = (year - 2013)
            
            let W = (L * 11) - 14 + day + month
            
            let moonAge = (W > 30) ? (W % 30) : W
            
            switch moonAge {
            case 0...2:
                return .newMoon
            case 3...5:
                return .waxingCrescent
            case 6...7:
                return .firstQuater
            case 8...11:
                return .waxingGibbous
            case 12...15:
                return .fullMoon
            case 16...19:
                return .waningGibbous
            case 20...23:
                return .lastQuater
            case 24...26:
                return .waningCrescent
            case 27...30:
                return .newMoon
                
            default:
                return .firstQuater
            }
        }
    }
    
    let date: Date
    
    let phase: Phase
    
    var image: UIImage? {
        switch phase {
        case .newMoon:
            return UIImage(named: "newMoon")
        case .waxingCrescent:
            return UIImage(named: "waxingCrescent")
        case .firstQuater:
            return UIImage(named: "firstQuater")
        case .waxingGibbous:
            return UIImage(named: "waxingGibbous")
        case .fullMoon:
            return UIImage(named: "fullMoon")
        case .waningGibbous:
            return UIImage(named: "waningGibbous")
        case .lastQuater:
            return UIImage(named: "lastQuater")
        case .waningCrescent:
            return UIImage(named: "waningCrescent")
        }
    }
    
//    static func withNextPhase(fromDate date: Date) -> MoonModel {
//
//        let currentPhase = Phase.forDate(date)
        
//        var addingDays = 1 {
//            didSet {
//                nextDay = Calendar.current.date(byAdding: .day, value: addingDays, to: date)
//            }
//        }
//
//
//        var nextDay = Calendar.current.date(byAdding: .day, value: addingDays, to: date) {
//            didSet {
//                let nextPhase = Phase.forDate(nextDay ?? date)
//                if nextPhase != currentPhase {
//                    return nextPhase
//                }
//            }
//        }
        
//    }
    
}
