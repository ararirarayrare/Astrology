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
    static let match = UIImage(named: "match")?.resized(to: CGSize(width: 25, height: 25))
    static let profile = UIImage(named: "profile")?.resized(to: CGSize(width: 25, height: 25))
    
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

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
        let widthRatio  = size.width  / self.size.width
        let heightRatio = size.height / self.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: self.size.width * heightRatio, height: self.size.height * heightRatio)
        } else {
            newSize = CGSize(width: self.size.width * widthRatio,  height: self.size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
