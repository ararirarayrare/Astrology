//
//  Extensions.swift
//  Astrology
//
//  Created by mac on 10.01.2023.
//

import UIKit

struct Icon {
    
    static let pencil = UIImage(named: "pencil")
    static let instagram = UIImage(named: "instagram")
    
    static let arrowRight = UIImage(named: "arrow-right")
    static let arrowLeft = UIImage(named: "arrow-left")
    
    static let home = UIImage(named: "home-button")
    static let match = UIImage(named: "match")
    static let profile = UIImage(named: "profile")
    
    static let male = UIImage(named: "male")
    static let female = UIImage(named: "female")
}

extension Date {

    static func daysFromBirthday(toDate date: Date?) -> Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        
        guard let birthDate = formatter.date(from: "20.11.2002") else {
            return 0
        }
        
       return Calendar.current.dateComponents([.day], from: birthDate, to: date ?? Date()).day ?? 0
    }
    
    static var dayBeforeYesterday: Date? {
        return Calendar.current.date(byAdding: .day, value: -2, to: Date())
    }
    
    static var dayAfterTomorrow: Date? {
        return Calendar.current.date(byAdding: .day, value: 2, to: Date())
    }
    
    static var yesterday: Date? {
        return Calendar.current.date(byAdding: .day, value: -1, to: Date())
    }
    
    static var tomorrow: Date? {
        return Calendar.current.date(byAdding: .day, value: 1, to: Date())
    }
}

extension DateFormatter {
    func string(from date: Date, format: String) -> String {
        self.dateFormat = format
        return string(from: date)
    }
    
    func date(from string: String, format: String) -> Date? {
        self.dateFormat = format
        return date(from: string)
    }
}

extension UIFont {
    
    static func regularPoppinsFont(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-Regular", size: size)
    }
    
    static func semiboldPoppinsFont(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "Poppins-SemiBold", size: size)
    }
    
    static func regularNunitoFont(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "Nunito-Regular", size: size)
    }
    
    static func semiboldNunitoFont(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "Nunito-SemiBold", size: size)
    }
    
    static func boldGothamPro(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "GothamPro-Bold", size: size)
    }
    
    static func mediumGothamPro(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "GothamPro-Medium", size: size)
    }
    
    static func blackGothamPro(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "GothamPro-Black", size: size)
    }
    
    static func italicGothamPro(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "GothamPro-Italic", size: size)
    }
    
    static func gothamPro(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "GothamPro", size: size)
    }
    
    static func italicBoldGothamPro(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "GothamPro-BoldItalic", size: size)
    }
}

extension UIImage {
    static let background0 = UIImage(named: "background0")
    static let background1 = UIImage(named: "background1")
}

extension UINavigationController {
    var rootViewController: UIViewController? {
        return viewControllers.first
    }
}

extension DateComponents: Comparable {
    public static func < (lhs: DateComponents, rhs: DateComponents) -> Bool {
        let now = Date()
        let calendar = Calendar.current
        return calendar.date(byAdding: lhs, to: now)! < calendar.date(byAdding: rhs, to: now)!
    }
}
