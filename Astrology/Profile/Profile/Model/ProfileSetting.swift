//
//  Setting.swift
//  Astrology
//
//  Created by mac on 13.01.2023.
//

import UIKit

enum ProfileSetting: CaseIterable {
    
    case editProfile, notifications, helpCenter, rateApp, logOut
    
    var title: String {
        switch self {
        case .editProfile:
            return "Edit profile"
        case .notifications:
            return "Notifications"
        case .helpCenter:
            return "Help center"
        case .rateApp:
            return "Rate app"
        case .logOut:
            return "Log out"
        }
    }
    
    var image: UIImage? {
        switch self {
        case .editProfile:
            return UIImage(systemName: "person")
        case .notifications:
            return UIImage(systemName: "bell")
        case .helpCenter:
            return UIImage(systemName: "questionmark.circle")
        case .rateApp:
            return UIImage(systemName: "star")
        case .logOut:
            return UIImage(systemName: "escape")
        }
    }
    
}
