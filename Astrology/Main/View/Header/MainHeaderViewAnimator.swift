//
//  MainHeaderViewAnimator.swift
//  Astrology
//
//  Created by mac on 06.01.2023.
//

import UIKit

class MainHeaderViewAnimator: UIViewPropertyAnimator {
    
    var shouldHide: Bool = true
    
    var hasAnimations: Bool = false
    
    var topOffset: CGFloat = 0
    
    var neededTopConstant: CGFloat {
        return shouldHide ? topOffset : 0
    }
    
    var neededBottomConsant: CGFloat {
        return shouldHide ? 32 : -120.0
    }
    
    var neededTransform: CGAffineTransform {
        return shouldHide ? CGAffineTransform(scaleX: 0.3, y: 0.3) : .identity
    }
    
    override func addAnimations(_ animation: @escaping () -> Void) {
        super.addAnimations(animation)
        
        hasAnimations = true
    }
    
    
    func addCompletion(_ completion: @escaping (Bool) -> Void) {
        super.addCompletion { _ in
            self.shouldHide = !self.shouldHide
            
            completion(!self.shouldHide)
            
            self.hasAnimations = false
        }
    }
    
}

