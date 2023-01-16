//
//  HomeTopView.swift
//  Astrology
//
//  Created by mac on 24.12.2022.
//

import UIKit

class HomeTopView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
                
        let dateFormatter = DateFormatter()

        let today = Date()
        let dateString = dateFormatter.string(from: today, format: "d MMMM")
        let weekdayString = dateFormatter.string(from: today, format: "EEEE")
        
        let attributedString = NSMutableAttributedString(
            string: dateString + ",\n",
            attributes: [
                .font : UIFont.semiboldPoppinsFont(ofSize: 26) ?? .boldSystemFont(ofSize: 24),
                .foregroundColor : UIColor.white
            ]
        )

        attributedString.append(
            NSAttributedString(
                string: weekdayString,
                attributes: [
                    .font : UIFont.regularNunitoFont(ofSize: 18) ?? .systemFont(ofSize: 18),
                    .foregroundColor : UIColor(red: 163/255, green: 149/255, blue: 202/255, alpha: 1.0)
                ]
            )
        )
        
        label.attributedText = attributedString
                
        return label
    }()
                
    init() {
        super.init(frame: .zero)
        
        setup()
        layout()
    }
    
    private func setup() {
        backgroundColor = .clear
    }

    private func layout() {
        addSubview(titleLabel)
                
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: 20),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                           constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: centerXAnchor,
                                                 constant: -24),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                               constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
