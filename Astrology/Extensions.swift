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
    
}

extension Date {
    static var yesterday: Date? {
        return Calendar.current.date(byAdding: .day, value: -1, to: Date())
    }
    
    static var tomorrow: Date? {
        return Calendar.current.date(byAdding: .day, value: 1, to: Date())
    }
}
