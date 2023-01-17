//
//  HomeHeaderViewAnimator.swift
//  Astrology
//
//  Created by mac on 06.01.2023.
//

import UIKit

final class HomeHeaderViewAnimator: UIViewPropertyAnimator {
    
    private(set) var shouldHide: Bool = true
    
    private(set) var hasAnimations: Bool = false
    
    var topOffset: CGFloat = 0
    
    var topConstant: CGFloat {
        return shouldHide ? topOffset : 0
    }
    
    var bottomConsant: CGFloat {
        return shouldHide ? 8 : -40
    }
    
    var signTransform: CGAffineTransform {
        return shouldHide ? CGAffineTransform(scaleX: 0.35, y: 0.35) : .identity
    }
    
    var detailsTransform: CGAffineTransform {
        return shouldHide ? CGAffineTransform(scaleX: 0.5, y: 0.01) : CGAffineTransform(scaleX: 1, y: 1)
    }
    
    var alpha: CGFloat {
        return shouldHide ? -1 : 1
    }
    
    func addAnimations(_ animation: @escaping (HomeHeaderViewAnimator) -> Void) {
        guard !hasAnimations else {
            return
        }
        
        addAnimations { animation(self) }
        
        hasAnimations = true
    }

    func addCompletion(_ completion: @escaping (Bool) -> Void) {
        super.addCompletion { _ in
            
            self.shouldHide = !self.shouldHide
            self.hasAnimations = false
            
            completion(!self.shouldHide)
        }
    }
 
    func completeAnimation() {
        continueAnimation(withTimingParameters: UISpringTimingParameters(dampingRatio: 1.0),
                          durationFactor: 0)
    }
}
