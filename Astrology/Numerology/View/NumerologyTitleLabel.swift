//
//  NumerologyTitleLabel.swift
//  Astrology
//
//  Created by mac on 05.01.2023.
//

import UIKit

class NumerologyTitleLabel: UILabel {
    
    private(set) var isAnimating: Bool = false
    
    init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animate(shouldHide: Bool) {
        isAnimating = true
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.alpha = shouldHide ? 0 : 1
        } completion: { [weak self] _ in
            self?.isAnimating = false
        }
    }
    
    private func setup() {
        font = UIFont(name: "Copperplate Bold", size: 26)
        textColor = .white
        textAlignment = .left
        adjustsFontSizeToFitWidth = true
        numberOfLines = 2
    }
}
