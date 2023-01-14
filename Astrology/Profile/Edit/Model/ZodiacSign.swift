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
    
    var dates: (from: DateComponents, to: DateComponents)? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM"
        
//        let components = Calendar.current.date(<#T##date: Date##Date#>, matchesComponents: <#T##DateComponents#>)
        
        switch self {
        case .aries:
           if let dateFrom = formatter.date(from: "21.03"),
              let dateTo = formatter.date(from: "19.04") {
               
               let componentsFrom = Calendar.current.dateComponents([.day, .month], from: dateFrom)
               let componentsTo = Calendar.current.dateComponents([.day, .month], from: dateTo)
               
               return (componentsFrom, componentsTo)
           }
            
//            return (formatter.date(from: "21.03"), formatter.date(from: "19.04"))
        case .taurus:
            if let dateFrom = formatter.date(from: "20.04"),
               let dateTo = formatter.date(from: "20.05") {
                
                let componentsFrom = Calendar.current.dateComponents([.day, .month], from: dateFrom)
                let componentsTo = Calendar.current.dateComponents([.day, .month], from: dateTo)
                
                return (componentsFrom, componentsTo)
            }
            
//            return (formatter.date(from: "20.04"), formatter.date(from: "20.05"))
        case .gemini:
            if let dateFrom = formatter.date(from: "21.05"),
               let dateTo = formatter.date(from: "21.06") {
                
                let componentsFrom = Calendar.current.dateComponents([.day, .month], from: dateFrom)
                let componentsTo = Calendar.current.dateComponents([.day, .month], from: dateTo)
                
                return (componentsFrom, componentsTo)
            }
            
//            return (formatter.date(from: "21.05"), formatter.date(from: "20.06"))
        case .cancer:
            if let dateFrom = formatter.date(from: "22.06"),
               let dateTo = formatter.date(from: "22.07") {
                
                let componentsFrom = Calendar.current.dateComponents([.day, .month], from: dateFrom)
                let componentsTo = Calendar.current.dateComponents([.day, .month], from: dateTo)
                
                return (componentsFrom, componentsTo)
            }
            
//            return (formatter.date(from: "21.06"), formatter.date(from: "22.07"))
        case .leo:
            if let dateFrom = formatter.date(from: "23.07"),
               let dateTo = formatter.date(from: "22.08") {
                
                let componentsFrom = Calendar.current.dateComponents([.day, .month], from: dateFrom)
                let componentsTo = Calendar.current.dateComponents([.day, .month], from: dateTo)
                
                return (componentsFrom, componentsTo)
            }
            
//            return (formatter.date(from: "23.07"), formatter.date(from: "22.08"))
        case .virgo:
            if let dateFrom = formatter.date(from: "23.08"),
               let dateTo = formatter.date(from: "22.09") {
                
                let componentsFrom = Calendar.current.dateComponents([.day, .month], from: dateFrom)
                let componentsTo = Calendar.current.dateComponents([.day, .month], from: dateTo)
                
                return (componentsFrom, componentsTo)
            }
            
//            return (formatter.date(from: "23.08"), formatter.date(from: "22.09"))
        case .libra:
            if let dateFrom = formatter.date(from: "23.09"),
               let dateTo = formatter.date(from: "22.10") {
                
                let componentsFrom = Calendar.current.dateComponents([.day, .month], from: dateFrom)
                let componentsTo = Calendar.current.dateComponents([.day, .month], from: dateTo)
                
                return (componentsFrom, componentsTo)
            }
            
//            return (formatter.date(from: "23.09"), formatter.date(from: "22.10"))
        case .scorpio:
            if let dateFrom = formatter.date(from: "23.10"),
               let dateTo = formatter.date(from: "21.11") {
                
                let componentsFrom = Calendar.current.dateComponents([.day, .month], from: dateFrom)
                let componentsTo = Calendar.current.dateComponents([.day, .month], from: dateTo)
                
                return (componentsFrom, componentsTo)
            }
            
//            return (formatter.date(from: "23.10"), formatter.date(from: "21.11"))
        case .sagittarius:
            if let dateFrom = formatter.date(from: "22.11"),
               let dateTo = formatter.date(from: "21.12") {
                
                let componentsFrom = Calendar.current.dateComponents([.day, .month], from: dateFrom)
                let componentsTo = Calendar.current.dateComponents([.day, .month], from: dateTo)
                
                return (componentsFrom, componentsTo)
            }
            
//            return (formatter.date(from: "22.11"), formatter.date(from: "21.12"))
        case .capricorn:
            if let dateFrom = formatter.date(from: "22.12"),
               let dateTo = formatter.date(from: "19.01") {
                
                let componentsFrom = Calendar.current.dateComponents([.day, .month], from: dateFrom)
                let componentsTo = Calendar.current.dateComponents([.day, .month], from: dateTo)
                
                return (componentsFrom, componentsTo)
            }
            
//            return (formatter.date(from: "22.12"), formatter.date(from: "19.01"))
        case .aquarius:
            if let dateFrom = formatter.date(from: "20.01"),
               let dateTo = formatter.date(from: "18.02") {
                
                let componentsFrom = Calendar.current.dateComponents([.day, .month], from: dateFrom)
                let componentsTo = Calendar.current.dateComponents([.day, .month], from: dateTo)
                
                return (componentsFrom, componentsTo)
            }
            
//            return (formatter.date(from: "20.01"), formatter.date(from: "18.02"))
        case .pisces:
            if let dateFrom = formatter.date(from: "19.02"),
               let dateTo = formatter.date(from: "20.03") {
                
                let componentsFrom = Calendar.current.dateComponents([.day, .month], from: dateFrom)
                let componentsTo = Calendar.current.dateComponents([.day, .month], from: dateTo)
                
                return (componentsFrom, componentsTo)
            }
            
//            return (formatter.date(from: "19.02"), formatter.date(from: "20.03"))
        }
        
        return nil
    }
    
    static func forDate(_ date: Date) -> Self? {
        var zodiacSign: Self? = nil
        
        allCases.forEach { sign in
            if let dates = sign.dates {
                let dateComponents = Calendar.current.dateComponents([.day, .month], from: date)

                if dateComponents > dates.from, dateComponents < dates.to {
                    zodiacSign = sign
                }
            }
        }
        
        return zodiacSign
    }
    
}
