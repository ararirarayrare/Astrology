//
//  ZodiacSign.swift
//  Astrology
//
//  Created by mac on 14.01.2023.
//

import UIKit

enum ZodiacSign: CaseIterable {
    
    case aries, taurus, gemini, cancer, leo, virgo, libra, scorpio, sagittarius, capricorn, aquarius, pisces
    
    var image: UIImage? {
        switch self {
        case .aries:
            return UIImage(named: "aries-sign")
        case .taurus:
            return UIImage(named: "taurus-sign")
        case .gemini:
            return UIImage(named: "gemini-sign")
        case .cancer:
            return UIImage(named: "cancer-sign")
        case .leo:
            return UIImage(named: "leo-sign")
        case .virgo:
            return UIImage(named: "virgo-sign")
        case .libra:
            return UIImage(named: "libra-sign")
        case .scorpio:
            return UIImage(named: "scorpio-sign")
        case .sagittarius:
            return UIImage(named: "sagittarius-sign")
        case .capricorn:
            return UIImage(named: "capricorn-sign")
        case .aquarius:
            return UIImage(named: "aquarius-sign")
        case .pisces:
            return UIImage(named: "pisces-sign")
        }
    }
    
    private func components(fromDate: String, to date: String) -> (from: DateComponents, to: DateComponents)? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM"
        
        guard let dateFrom = formatter.date(from: fromDate),
              let dateTo = formatter.date(from: date) else {
            return nil
        }
        
        let componentsFrom = Calendar.current.dateComponents([.day, .month], from: dateFrom)
        let componentsTo = Calendar.current.dateComponents([.day, .month], from: dateTo)
        
        return (componentsFrom, componentsTo)
    }
    
    func dates() -> [(from: DateComponents, to: DateComponents)?] {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM"
    
        switch self {
        case .aries:
            
            if let components = components(fromDate: "21.03", to: "19.04") {
                return [components]
            }

        case .taurus:

            if let components = components(fromDate: "20.04", to: "20.05") {
                return [components]
            }
            
        case .gemini:
            
            if let components = components(fromDate: "21.05", to: "21.06") {
                return [components]
            }
            
        case .cancer:

            if let components = components(fromDate: "22.06", to: "22.07") {
                return [components]
            }
            
        case .leo:

            if let components = components(fromDate: "23.07", to: "22.08") {
                return [components]
            }
            
        case .virgo:

            if let components = components(fromDate: "23.08", to: "22.09") {
                return [components]
            }
            
        case .libra:

            if let components = components(fromDate: "23.09", to: "22.10") {
                return [components]
            }
            
        case .scorpio:
            
            if let components = components(fromDate: "23.10", to: "21.11") {
                return [components]
            }
            
        case .sagittarius:

            if let components = components(fromDate: "22.11", to: "21.12") {
                return [components]
            }
            
        case .capricorn:

                if let firstComponents = components(fromDate: "01.01", to: "19.01"),
                   let lastComponents = components(fromDate: "22.12", to: "31.12") {
                    return [firstComponents, lastComponents]
                }
            
        case .aquarius:
            
            if let components = components(fromDate: "20.01", to: "18.02") {
                return [components]
            }
            
        case .pisces:
            
            if let components = components(fromDate: "19.02", to: "20.03") {
                return [components]
            }
            
        }
        
        return []
    }
    
    static func forDate(_ date: Date) -> Self? {
        var zodiacSign: Self? = nil
        
        let dateComponents = Calendar.current.dateComponents([.day, .month], from: date)
        
        allCases.forEach { sign in
            let dates = sign.dates()
            
            dates.forEach { date in
                if let date = date, dateComponents >= date.from, dateComponents <= date.to {
                    zodiacSign = sign
                    return
                }
            }
        }
        
        return zodiacSign
    }
    
}
