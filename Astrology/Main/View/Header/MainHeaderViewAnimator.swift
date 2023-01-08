//
//  MainHeaderViewAnimator.swift
//  Astrology
//
//  Created by mac on 06.01.2023.
//

import UIKit

class MainHeaderViewAnimator: UIViewPropertyAnimator {
    
//    private(set) var isCompletingAnimation: Bool = false
    
    private(set) var shouldHide: Bool = true
    
    private(set) var hasAnimations: Bool = false
    
    var topOffset: CGFloat = 0
    
    var neededTopConstant: CGFloat {
        return shouldHide ? topOffset : 0
    }
    
    var neededBottomConsant: CGFloat {
        return shouldHide ? 12 : -60
    }
    
    var neededTransform: CGAffineTransform {
        return shouldHide ? CGAffineTransform(scaleX: 0.35, y: 0.35) : .identity
    }
    
    override func addAnimations(_ animation: @escaping () -> Void) {
        guard !hasAnimations else {
            return
        }
        
        super.addAnimations(animation)
        
        hasAnimations = true
//        isCompletingAnimation = false
        
//        print(isCompletingAnimation, "FROM ADD ANIM")
    }
    
    
    func addCompletion(_ completion: @escaping (Bool) -> Void) {
        super.addCompletion { _ in
            
            self.shouldHide = !self.shouldHide

            self.hasAnimations = false
//            self.isCompletingAnimation = false
            
//            print(self.isCompletingAnimation, "FROM COMPLETION")
                        
            completion(!self.shouldHide)
        }
    }
    
    func completeAnimation() {
//        guard !isCompletingAnimation else {
//            return
//        }
        
//        isCompletingAnimation = true
                
        continueAnimation(withTimingParameters: UISpringTimingParameters(dampingRatio: 1.0),
                          durationFactor: 0)
    }
    
 
}

