//
//  MainInfoView.swift
//  Astrology
//
//  Created by mac on 24.12.2022.
//

import UIKit

class MainHeaderView: UIView {

    var topConstraint: NSLayoutConstraint?
    
    private var signBottomConstraint: NSLayoutConstraint?
    
    private let signImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "cancer-sign")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    let animator = MainHeaderViewAnimator(duration: 0.4, dampingRatio: 1.0)
    
    init() {
        super.init(frame: .zero)
                
        setup()
        layout()
    }
    
    func resetAnimations(withCompletion completion: @escaping (Bool) -> Void) {
        animator.stopAnimation(false)
        animator.finishAnimation(at: .current)
        
//        self.layoutIfNeeded()
//        self.superview?.layoutIfNeeded()
        
//        self.signBottomConstraint?.constant = self.animator.neededBottomConsant
//        self.topConstraint?.constant = self.animator.neededTopConstant
        
        self.setNeedsLayout()
        self.superview?.setNeedsLayout()
        
        animator.addAnimations { [weak self] in
            guard let self = self else {
                return
            }

            self.signImageView.transform = self.animator.neededTransform
            
            self.signBottomConstraint?.constant = self.animator.neededBottomConsant
            self.topConstraint?.constant = self.animator.neededTopConstant
                                    
            self.layoutIfNeeded()
            self.superview?.layoutIfNeeded()
            
//            self.setNeedsLayout()
//            self.superview?.setNeedsLayout()
        }
        
        animator.addCompletion(completion)
    }
    
    private func setup() {
        
    }
    
    private func layout() {
        addSubview(signImageView)
        
        let signBottomConstraint = signImageView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                                         constant: -120)
        self.signBottomConstraint = signBottomConstraint
        
        NSLayoutConstraint.activate([
            signImageView.widthAnchor.constraint(equalTo: widthAnchor,
                                                 multiplier: 0.35),
            signImageView.heightAnchor.constraint(equalTo: signImageView.widthAnchor),
            signImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            signBottomConstraint
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
