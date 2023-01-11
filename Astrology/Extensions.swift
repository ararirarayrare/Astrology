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
}

extension UIFont {
    static func boldGothamPro(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "GothamPro-Bold", size: size)
    }
    
    static func mediumGothamPro(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "GothamPro-Medium", size: size)
    }
    
    static func blackGothamPro(ofSize size: CGFloat) -> UIFont? {
        return UIFont(name: "GothamPro-Black", size: size)
    }
}
