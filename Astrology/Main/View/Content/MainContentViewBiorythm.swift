//
//  MainContentViewBiorythm.swift
//  Astrology
//
//  Created by mac on 28.12.2022.
//

import UIKit

class MainContentViewBiorythm: MainContentViewItem {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Biorythm:"
        
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 12
                
        return stackView
    }()
    
    init(biorythms: [Biorythm]) {
        super.init()
        
        setup(with: biorythms)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layout() {
        super.layout()
        
        addSubview(titleLabel)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: 0),
            titleLabel.topAnchor.constraint(equalTo: topAnchor,
                                            constant: 20),
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setup(with biorythms: [Biorythm]) {
        backgroundColor = .clear
        
        biorythms.forEach {
            let view = createBarView(biorythm: $0)
            stackView.addArrangedSubview(view)
        }
    }
    
    private func createBarView(biorythm: Biorythm) -> UIView {
        let view = UIView()
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .boldSystemFont(ofSize: 18)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.adjustsFontSizeToFitWidth = true
        
        let attributedString = NSMutableAttributedString()
        
        attributedString.append(
            NSAttributedString(
                string: biorythm.title + "\n",
                attributes: [
                    .font : UIFont.boldSystemFont(ofSize: 18),
                    .foregroundColor : UIColor.white
                ]
            )
        )
        
        attributedString.append(
            NSAttributedString(
                string: "\(Int(biorythm.value * 100))%",
                attributes: [
                    .font : UIFont.systemFont(ofSize: 16),
                    .foregroundColor : UIColor.white
                ]
            )
        )
        
        titleLabel.attributedText = attributedString
        
        let barView = UIView()
        barView.translatesAutoresizingMaskIntoConstraints = false
        barView.backgroundColor = biorythm.barColor
    
        view.addSubview(titleLabel)
        view.addSubview(barView)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            barView.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
            barView.widthAnchor.constraint(equalToConstant: 16),
            barView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor,
                                            constant: -4),
            barView.heightAnchor.constraint(equalTo: view.heightAnchor,
                                            multiplier: 0.75 * biorythm.value)
        ])
                
        return view
    }
    
}
