//
//  Numerology.swift
//  Astrology
//
//  Created by mac on 12.01.2023.
//

import Foundation

enum Numerology: CaseIterable {
    
    case name, radial, evil, destiny
    
    var title: String {
        switch self {
        case .name:
            return "Name number"
        case .radial:
            return "Radial number"
        case .evil:
            return "Evil number"
        case .destiny:
            return "Destiny number"
        }
    }
    
    var number: Int {
        switch self {
        case .name:
            return 9
        case .radial:
            return 23
        case .evil:
            return 2
        case .destiny:
            return 7
        }
    }
    
    var numberTitle: String {
        switch number {
        default:
            return "Independence"
        }
    }
    
    var description: String {
        switch number {
        default:
            return "As a name number, 1 stands for determination and independence. It indicates that you have a strong spirit and the ability to succeed across the board, especially when other people are involved.\n\nYou're a great forward-thinker, with a gift for planning and organisation. This means you're prepared to seize any opportunity that comes your way\n\nWhether you seek it or not, you're often the centre of your social circle. Among those with the destiny number 1 are writers, poets, musicians, actors and leaders in many professional fields."
        }
    }
    
}
