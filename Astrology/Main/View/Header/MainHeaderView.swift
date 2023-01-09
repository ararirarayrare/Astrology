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
    
    private let leftDetailsView: MainHeaderViewDetails = {
        let details = [
            "Gender" : "Male",
            "Birth stone" : "Ruby",
            "Color" : "White"
        ]
        
        let view = MainHeaderViewDetails(details: details, textAligment: .left)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private let rightDetailsView: MainHeaderViewDetails = {
        let details = [
            "Animal" : "Cow",
            "Age" : "20",
            "Name" : "Artem"
        ]
        
        let view = MainHeaderViewDetails(details: details, textAligment: .right)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let animator = MainHeaderViewAnimator(duration: 0.4, dampingRatio: 1.0)
    
    let detailsAnimator = MainHeaderViewAnimatorDetails(duration: 0.25, curve: .linear)
    
    private var leftCenter: CGPoint = .zero
    private var rightCenter: CGPoint = .zero
    
    init() {
        super.init(frame: .zero)
                
        setup()
        layout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if leftCenter.equalTo(.zero), rightCenter.equalTo(.zero), !bounds.height.isEqual(to: .zero) {
            leftCenter = leftDetailsView.center
            rightCenter = rightDetailsView.center
        }
    }
    
    
    func resetAnimations(withCompletion completion: @escaping (Bool) -> Void) {

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
        
        detailsAnimator.addAnimations {
             
            self.leftDetailsView.transform = self.detailsAnimator.neededTransform
            self.rightDetailsView.transform = self.detailsAnimator.neededTransform
            
            self.leftDetailsView.alpha = self.detailsAnimator.neededAlpha
            self.rightDetailsView.alpha = self.detailsAnimator.neededAlpha
            
        }
        
        
        animator.addCompletion(completion)
    }
    
    private func setup() {
        
    }
    
    private func layout() {
        addSubview(leftDetailsView)
        addSubview(rightDetailsView)
        addSubview(signImageView)
        signImageView.addSubview(signLabel)
        
        let signBottomConstraint = signImageView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                                         constant: -60)
        
        let leftDetailsLeadingConstraint = leftDetailsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        
        let rightDetailsTrailingConstraint = rightDetailsView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        
        self.signBottomConstraint = signBottomConstraint
        self.leftDetailsView.leadingConstraint = leftDetailsLeadingConstraint
        self.rightDetailsView.trailingConstraint = rightDetailsTrailingConstraint
        
        NSLayoutConstraint.activate([
            signImageView.widthAnchor.constraint(equalTo: widthAnchor,
                                                 multiplier: 0.25),
            signImageView.heightAnchor.constraint(equalTo: signImageView.widthAnchor),
            signImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            signBottomConstraint,
            
            
            signLabel.bottomAnchor.constraint(equalTo: signImageView.topAnchor),
            signLabel.centerXAnchor.constraint(equalTo: signImageView.centerXAnchor),
            
            
            leftDetailsLeadingConstraint,
            leftDetailsView.trailingAnchor.constraint(equalTo: signImageView.leadingAnchor,
                                                      constant: -8),
            leftDetailsView.centerYAnchor.constraint(equalTo: signImageView.centerYAnchor),
            
            
            rightDetailsTrailingConstraint,
            rightDetailsView.leadingAnchor.constraint(equalTo: signImageView.trailingAnchor,
                                                      constant: 8),
            rightDetailsView.centerYAnchor.constraint(equalTo: signImageView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
