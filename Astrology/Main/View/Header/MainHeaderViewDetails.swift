//
//  MainInfoViewDetails.swift
//  Astrology
//
//  Created by mac on 29.12.2022.
//

import UIKit

class MainHeaderViewDetails: UIStackView {
    
    var leadingConstraint: NSLayoutConstraint?
    var trailingConstraint: NSLayoutConstraint?
    
    init(details: [String : String], textAligment: NSTextAlignment) {
        super.init(frame: .zero)
                        
        setup(with: details, textAligment: textAligment)
        
    }
    
    private func createDetailView(title: String,
                                  subtitle: String,
                                  textAligment: NSTextAlignment,
                                  index: Int) -> UIView {
        let view = UIView()
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 14)
        titleLabel.textColor = UIColor(red: 205/255, green: 205/255, blue: 205/255, alpha: 1.0)
        titleLabel.textAlignment = textAligment
        titleLabel.text = title
        
        let subtitleLabel = UILabel()
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = .boldSystemFont(ofSize: 16)
        subtitleLabel.textColor = UIColor(red: 144/255, green: 105/255, blue: 1, alpha: 1.0)
        subtitleLabel.textAlignment = textAligment
        subtitleLabel.numberOfLines = 2
        subtitleLabel.text = subtitle
        
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        
        let constant = (index == 1) ? 0 : 8.0
        
        var subtitleConstant: CGFloat {
            var constant: CGFloat = 0
            if index == 0 {
                constant = -4
            } else if index == 2 {
                constant = 4
            }
            
            return (textAligment == .left) ? constant : -constant
        }
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                                constant: constant),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor,
                                            constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                                 constant: -constant),
            
            
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor,
                                                   constant: subtitleConstant),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor,
                                                    constant: subtitleConstant),
            subtitleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                                  constant: -4)
        ])
        
        return view
    }
    
    private func setup(with details: [String : String], textAligment: NSTextAlignment) {
        axis = .vertical
        spacing = 4
        distribution = .fillEqually
            
        for (index, item) in details.enumerated() {
            let view = createDetailView(title: item.key,
                                        subtitle: item.value,
                                        textAligment: textAligment,
                                        index: index)
            addArrangedSubview(view)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
