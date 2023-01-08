//
//  MainHeaderViewAnimator.swift
//  Astrology
//
//  Created by mac on 06.01.2023.
//

import UIKit

class MainHeaderViewAnimator: UIViewPropertyAnimator {
    
    var isCompletingAnimation: Bool = false
    
    var shouldHide: Bool = true
    
    private(set) var hasAnimations: Bool = false
    
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
        isCompletingAnimation = false
    }
    
    
    func addCompletion(_ completion: @escaping (Bool) -> Void) {
        super.addCompletion { _ in
            
//            if !self.finishedAtStart {
                self.shouldHide = !self.shouldHide
//            }

//            self.isReversed = false
//            self.resetToStart = false
            
            self.hasAnimations = false
            self.isCompletingAnimation = false
            
//            self.finishedAtStart = false
            
            completion(!self.shouldHide)
        }
    }
    
    func completeAnimation() {
        guard !isCompletingAnimation else {
            return
        }
        
        isCompletingAnimation = true
        
        continueAnimation(withTimingParameters: UISpringTimingParameters(dampingRatio: 1.0),
                          durationFactor: 0)
    }
    
    
//    func toBeginning() {
//        let displayLink = CADisplayLink(target: self, selector: #selector(fractionToZero(_:)))
//        displayLink.add(to: .main, forMode: .common)
//
//        isCompletingAnimation = true
//        resetToStart = true
//    }
    
//    @objc
//    private func fractionToZero(_ displayLink: CADisplayLink) {
//        fractionComplete -= 0.04
//
//        if fractionComplete < 0.05 {
//            fractionComplete = 0
//            displayLink.invalidate()
//            isCompletingAnimation = false
//            stopAnimation(false)
//            finishAnimation(at: .start)
//        }
//    }
}

