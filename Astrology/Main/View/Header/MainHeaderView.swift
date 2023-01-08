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
    
    private let signLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont(name: "Copperplate Bold", size: 16)
        label.textAlignment = .center
        label.textColor = UIColor(red: 189/255, green: 158/255, blue: 1, alpha: 1.0)
        
        label.layer.shadowRadius = 2
        label.layer.shadowColor = label.textColor.cgColor
        label.layer.shadowOpacity = 0.9
        label.layer.shadowOffset.height = 1
        
        label.text = "Cancer"
        
        return label
    }()
    
    let animator = MainHeaderViewAnimator(duration: 0.4, dampingRatio: 1.0)
    
    init() {
        super.init(frame: .zero)
                
        setup()
        layout()
    }
    
    func resetAnimations(withCompletion completion: @escaping (Bool) -> Void) {
//        animator.stopAnimation(false)
//        animator.finishAnimation(at: .current)

        self.setNeedsLayout()
        self.superview?.setNeedsLayout()
        
        animator.addAnimations { [weak self] in
            guard let self = self else {
                return
            }

            self.signImageView.transform = self.animator.neededTransform
            
            self.signBottomConstraint?.constant = self.animator.neededBottomConsant
            self.topConstraint?.constant = self.animator.neededTopConstant
        
            self.signLabel.alpha = self.animator.shouldHide ? 0 : 1
                                    
            self.layoutIfNeeded()
            self.superview?.layoutIfNeeded()
        }
        
        animator.addCompletion(completion)
    }
    
    private func setup() {
        
    }
    
    private func layout() {
        addSubview(signImageView)
        signImageView.addSubview(signLabel)
        
        let signBottomConstraint = signImageView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                                         constant: -60)
        self.signBottomConstraint = signBottomConstraint
        
        NSLayoutConstraint.activate([
            signImageView.widthAnchor.constraint(equalTo: widthAnchor,
                                                 multiplier: 0.25),
            signImageView.heightAnchor.constraint(equalTo: signImageView.widthAnchor),
            signImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            signBottomConstraint,
            
            
            signLabel.bottomAnchor.constraint(equalTo: signImageView.topAnchor),
            signLabel.centerXAnchor.constraint(equalTo: signImageView.centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
