//
//  HomeHeaderView.swift
//  Astrology
//
//  Created by mac on 24.12.2022.
//

import UIKit

class HomeHeaderView: UIView {

    var topConstraint: NSLayoutConstraint?
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = UIImage(named: "main-header-bg")
        imageView.contentMode = .scaleAspectFill
        
        imageView.alpha = 0.75

        return imageView
    }()
    
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
        
        label.font = .semiboldNunitoFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = UIColor(red: 189/255, green: 158/255, blue: 1, alpha: 1.0)
        
        label.text = "Cancer"
        
        return label
    }()
    
    private let leftDetailsView: HomeHeaderViewDetails = {
        let details = [
            "Gender" : "Male",
            "Birth stone" : "Ruby",
            "Color" : "White"
        ]
        
        let view = HomeHeaderViewDetails(details: details, textAligment: .left)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let rightDetailsView: HomeHeaderViewDetails = {
        let details = [
            "Animal" : "Cow",
            "Age" : "20",
            "Name" : "Artem"
        ]
        
        let view = HomeHeaderViewDetails(details: details, textAligment: .right)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    let animator = HomeHeaderViewAnimator(duration: 0.4, dampingRatio: 1.0)
    
    init() {
        super.init(frame: .zero)
                
        setup()
        layout()
    }
    
    
    func resetAnimations(withCompletion completion: @escaping (Bool) -> Void) {

        self.setNeedsLayout()
        self.superview?.setNeedsLayout()
        
        animator.addAnimations { [weak self] animator in
            guard let self = self else {
                return
            }
            
            
//            self.backgroundImageView.transform = animator.shouldHide ? .identity : CGAffineTransform(scaleX: 1.2, y: 1.0)
            self.backgroundImageView.alpha = animator.shouldHide ? 0.5 : 0.75
            
            self.layer.shadowOpacity = animator.shouldHide ? 0.95 : 0

            self.signImageView.transform = animator.signTransform
            
            self.signBottomConstraint?.constant = animator.bottomConsant
            self.topConstraint?.constant = animator.topConstant
        
            self.signLabel.alpha = animator.shouldHide ? 0 : 1
                        
            let x = animator.shouldHide ? 260.0 : 0
            let y = animator.shouldHide ? -12.0 : 0
            
            let leftTransform = animator.detailsTransform.translatedBy(x: x, y: y)
            
            let rightTransform = animator.detailsTransform.translatedBy(x: -x, y: y)
            
            self.leftDetailsView.transform = leftTransform
            self.rightDetailsView.transform = rightTransform
            
            self.leftDetailsView.alpha = animator.alpha
            self.rightDetailsView.alpha = animator.alpha
                                    
            self.layoutIfNeeded()
            self.superview?.layoutIfNeeded()
        }
         
        animator.addCompletion(completion)
    }
    
    private func setup() {
        backgroundColor = UIColor(red: 24/255, green: 17/255, blue: 38/255, alpha: 1.0)
        
        layer.shadowColor = backgroundColor?.cgColor
        layer.shadowRadius = 8
        layer.shadowOpacity = 0
        layer.shadowOffset.height = 16
    }
    
    private func layout() {
        addSubview(backgroundImageView)
        addSubview(leftDetailsView)
        addSubview(rightDetailsView)
        addSubview(signImageView)
        
        signImageView.addSubview(signLabel)
        
        let signBottomConstraint = signImageView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                                         constant: -40)
        self.signBottomConstraint = signBottomConstraint
        
        
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            signImageView.widthAnchor.constraint(equalTo: widthAnchor,
                                                 multiplier: 0.25),
            signImageView.heightAnchor.constraint(equalTo: signImageView.widthAnchor),
            signImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            signBottomConstraint,
            
            
            signLabel.bottomAnchor.constraint(equalTo: signImageView.topAnchor),
            signLabel.centerXAnchor.constraint(equalTo: signImageView.centerXAnchor),
            

            leftDetailsView.trailingAnchor.constraint(equalTo: signImageView.leadingAnchor,
                                                      constant: -8),
            leftDetailsView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                     constant: 32),
            leftDetailsView.centerYAnchor.constraint(equalTo: signImageView.centerYAnchor,
                                                    constant: -8),
            

            rightDetailsView.leadingAnchor.constraint(equalTo: signImageView.trailingAnchor,
                                                      constant: 8),
            rightDetailsView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                       constant: -32),
            rightDetailsView.centerYAnchor.constraint(equalTo: signImageView.centerYAnchor,
                                                     constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
