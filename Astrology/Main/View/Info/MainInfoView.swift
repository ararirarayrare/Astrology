//
//  MainInfoView.swift
//  Astrology
//
//  Created by mac on 24.12.2022.
//

import UIKit

class MainInfoView: UIView {
    
    private(set) var isAnimating: Bool = false
    
    private(set) var isPrehidden: Bool = false
    
    var isOpen: Bool = true
        
    var topConstraint: NSLayoutConstraint?
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "info-bg")
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let detailsView: MainInfoViewDetails = {
        let details: [String : String] = [
            "Symbol" : "Razor (Axe, sharp edge, or flame)",
            "Color" : "White",
            "Gender" : "Male",
            "Birth stone" : "Ruby"
        ]
        
        let view = MainInfoViewDetails(details: details)
        
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        
        userImageView.image = UIImage(named: "user")
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 16
        layer.shadowOffset.height = 16
        layer.shadowOpacity = 0
        
        layout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if layer.shadowPath == nil, bounds != .zero {
            layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: 0).cgPath
        }
    }
    
    func prehide() {
        guard !isPrehidden else {
            return
        }
        
        isPrehidden = true
        
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.backgroundImageView.alpha = 0.5
            self?.userImageView.alpha = 0.2
            self?.detailsView.alpha = 0.2
        }
    }

    func animate(transparent: Bool,
                 topConstraintConstant constant: CGFloat = 0,
                 completion: @escaping () -> Void) {
        guard !isAnimating, topConstraint?.constant != constant else {
            return
        }
        
        isAnimating = true
            
        UIView.animate(withDuration: 0.35) { [weak self] in
            self?.topConstraint?.constant = constant
            self?.backgroundImageView.alpha = transparent ? 0.5 : 1.0
            self?.userImageView.alpha = transparent ? 0 : 1
            self?.detailsView.alpha = transparent ? 0 : 1
            self?.layer.shadowOpacity = transparent ? 0.95 : 0
            self?.superview?.layoutIfNeeded()
        } completion: { [weak self] _ in
            self?.isAnimating = false
            self?.isOpen = !transparent
            self?.isPrehidden = false
            completion()
        }
        
    }
    
    private func layout() {
        addSubview(backgroundImageView)
        addSubview(userImageView)
        addSubview(detailsView)
                
        NSLayoutConstraint.activate([
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            userImageView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor,
                                                  constant: -20),
            userImageView.trailingAnchor.constraint(equalTo: backgroundImageView.trailingAnchor,
                                                   constant: -48),
            userImageView.widthAnchor.constraint(equalTo: backgroundImageView.widthAnchor,
                                                 multiplier: 0.2),
            userImageView.heightAnchor.constraint(equalTo: userImageView.widthAnchor,
                                                  multiplier: 2.5),
            
            
            detailsView.leadingAnchor.constraint(equalTo: backgroundImageView.leadingAnchor,
                                                 constant: 32),
            detailsView.trailingAnchor.constraint(equalTo:backgroundImageView.centerXAnchor),
            detailsView.bottomAnchor.constraint(equalTo: backgroundImageView.bottomAnchor,
                                                constant: -8),
//            detailsView.heightAnchor.constraint(equalTo: backgroundImageView.heightAnchor,
//                                                multiplier: 0.6)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
